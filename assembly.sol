pragma solidity ^0.4.0;

// functional assembly
contract Assembly {
    // gas cos = 1000
    function solidityLoop() public returns (uint _r){
        for(uint i = 0; i < 10; i++) {
            _r++;
        }   
    }
    
    // gas cost = 700
    function asmLoops() public returns (uint _j) {
        assembly {
            let i := 0
            loop:
            i := add(i, 1)
            _j := add(_j, 1)
            jumpi(loop, lt(i, 10))
        }
    }
    
    function asmReturns(uint _v) public returns (uint) {
        assembly {
            let _ptr := add(msize(), 1)
            mstore(_ptr, _v)
            return(_ptr, 0x20)
        }
    }
}