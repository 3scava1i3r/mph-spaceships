// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.8.4;

import "hardhat/console.sol";
import "./88mph/DInterest.sol";


contract Ships is DInterest {

    struct Engine {
        uint8 marketType;  // marketType has ( 0 = DAI,1 = USDC ) and others to be decided all from Aavepool
        string uri;     // uri for the engine with all metadata
        //uint256 ID;     // 
        address owner;
    }
    

    mapping (uint256 => Engine) public EngineList; //here uint256 is the depositID

    event Minted(uint8 _marketType,string uri,address owner);

    
    function mintEngine(uint8 _marketType,address poolAddress ,uint256 depositAmount, uint64 expireTimestamp, uint256 depositPeriodInSeconds, string calldata _uri) public returns(uint256 nftID,uint256 interestAmount) {
        
        // will add require statements later


        DInterest pool = DInterest(poolAddress);
        (nftID,interestAmount) = pool.deposit(depositAmount,expireTimestamp,0,_uri); //depositing funds and creating engine NFT for transfer
        
        // adding the depositId as a key to the EngineValues
        EngineList[nftID].marketType = _marketType;
        EngineList[nftID].uri = _uri;
        EngineList[nftID].owner = msg.sender;

        emit Minted(_marketType,_uri,msg.sender);

    }

     
    function safeTransferEngine() public{}
    
    

}