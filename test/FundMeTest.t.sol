// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        // Log the owner address and msg.sender
        console.log("Owner address:", fundMe.i_owner());
        console.log("msg.sender:", msg.sender);

        // Example string logs (could be removed if unnecessary)
        console.log("Example log message 1");
        console.log("Example log message 2");
        console.log("Example log message 3");
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testVersionIsCorrect() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}
