pragma solidity ^0.8.0;

import "./StakingContract.sol";

contract StakingContractV2 is StakingContract {
  
    function unstake2(uint256 _unstakeBalance) external {
        staked memory user = StakedUser[msg.sender];
        require(user.timeLockedTill <= block.timestamp, "cannot unstake");
        require(user.stakedBal >= _unstakeBalance, "not enough staked Balance");
        StakingToken.transfer(msg.sender, _unstakeBalance);
        RewardToken.mint(msg.sender, _unstakeBalance*2);
        if (user.stakedBal == _unstakeBalance) {
            delete StakedUser[msg.sender];
        } else {
            user.stakedBal -= _unstakeBalance;
            StakedUser[msg.sender] = user;
        }
    }
}