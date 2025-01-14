```solidity
function withdraw(uint amount) public {
        require(amount <= balanceOf[msg.sender], "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
}
```
This code has a common bug: it doesn't handle potential failures of the `transfer` function.  If the recipient's address is invalid or there is insufficient gas for the transfer, the transaction will revert, leaving the contract in an inconsistent state.