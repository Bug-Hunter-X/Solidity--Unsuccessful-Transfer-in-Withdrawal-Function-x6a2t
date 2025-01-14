```solidity
function safeTransfer(address to, uint value) internal {
        require(to != address(0), "Transfer to the zero address");
        (bool success, ) = to.call{value: value}(new bytes(0));
        require(success, "Transfer failed");
    }

function withdraw(uint amount) public {
        require(amount <= balanceOf[msg.sender], "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        safeTransfer(payable(msg.sender), amount);
}
```