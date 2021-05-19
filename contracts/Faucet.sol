// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Faucet {
    // lastTokenClaimRecord[tokenContractAddress][msg.sender] = lastClaimTimestamp
    mapping(address => mapping(address => uint256)) lastTokenClaimRecord;
    // last 
    mapping(address => uint256) lastCfxClaimRecord;

    uint256 internal interval = 30 seconds;

    uint256 defaultAmount = 1e18;

    // constructor(uint _interval, uint256 _defaultAmount) public {
    //     interval = _interval;
    //     defaultAmount = _defaultAmount;
    // }

    // function nextTokenClaim(address tokenContractAddress) public view {

    // }

    function claimToken(address tokenContractAddress) public {
        uint256 lastTs = lastTokenClaimRecord[tokenContractAddress][msg.sender];
        require(block.timestamp - lastTs > interval, "Claim interval too short");
        lastTokenClaimRecord[tokenContractAddress][msg.sender] = block.timestamp;
        IERC20(tokenContractAddress).transfer(msg.sender, defaultAmount);
    }

    function claimCfx() public payable{
        uint256 lastTs = lastCfxClaimRecord[msg.sender];
        require(block.timestamp - lastTs > interval, "Claim interval too short");
        lastCfxClaimRecord[msg.sender] = block.timestamp;
        // will revert if there is no enough cfx balance
        msg.sender.transfer(defaultAmount);
    }

    receive() external payable {
        
    }
}