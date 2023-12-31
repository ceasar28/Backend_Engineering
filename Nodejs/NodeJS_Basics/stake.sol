//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import {IStandardToken} from "IStandardToken.sol";

// allow users to stake standardToken
//able to view the totaltal amount stake by any user
//allows user to be able withdraw their stake amount

contract StakingContract{
    IStandardToken standardToken;
struct User{
    uint amountStaked;
    uint timeStaked;
}
mapping (address => User) user;

event Staked(uint amountstake, uint totalAmountStaked, uint time);
// allow users to stake standardToken

//set the address of the Token to be staked
constructor(address _standardToken){
    standardToken = IStandardToken(_standardToken);
}
    function stake(uint amount) external {
        uint balance = standardToken.balanceOf(msg.sender);
        require(balance >=  amount, "ERC20 insuficient balance");
        //make external call to standardToken by calling transferfrom;
        bool status = standardToken.transferFrom(msg.sender, address(this), amount);
        require(status == true, "transfer Failed");
        //update state after confirming transfer of standardToken
        User storage _user = user[msg.sender];
        _user.amountStaked += amount;
        _user.timeStaked = block.timestamp;
        emit Staked(amount, _user.amountStaked, block.timestamp);
    }

        // Function to calculate and distribute rewards
    function distributeRewards() external {
        require(msg.sender == owner, "Only the owner can distribute rewards");
        
        // Calculate rewards based on the duration of staking
        uint256 totalReward = rewardToken.balanceOf(address(this));
        
        for (address stakerAddress = getStakers()) {
            Stake storage staker = stakers[stakerAddress];
            uint256 duration = block.timestamp - staker.startTime;
            uint256 entitledReward = (staker.amount * duration) / (365 days); // Adjust as needed
            
            // Transfer the entitled reward to the staker
            rewardToken.transfer(stakerAddress, entitledReward);
        }
    }

        // Function to get the list of stakers
    function getStakers() public view returns (address[] memory) {
        address[] memory stakerList = new address[](100); // Adjust the size as needed
        
        uint256 count = 0;
        for (address stakerAddress : stakers) {
            if (stakers[stakerAddress].amount > 0) {
                stakerList[count] = stakerAddress;
                count++;
            }
        }
        
        // Resize the array to remove empty slots
        address[] memory result = new address[](count);
        for (uint256 i = 0; i < count; i++) {
            result[i] = stakerList[i];
        }
        
     

    function getStakeAmount(address who) public view returns(uint _staked){
        User storage _user = user[who];
      _staked = _user.amountStaked;
    }

    function withdraw(uint amount) external{
         uint totalStaked = getStakeAmount(msg.sender);
         require(totalStaked >= amount, "insufficent stake amount");
         User storage _user = user[msg.sender];
         _user.amountStaked -= amount;
         standardToken.transfer(msg.sender, amount);

    }

    function withdrawEther()  external{
        standardToken.withdrawEther();
        payable(msg.sender).transfer(address(this).balance);
    

    }
    // receive() external payable{}
    fallback() external payable{}


}