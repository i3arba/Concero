// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {AutomationCompatibleInterface} from "@chainlink/contracts/src/v0.8/automation/AutomationCompatible.sol";

error ConceroTask_NotEnoughBlocksPassed(uint256 blockNumberNow);
error ConceroTask_NotAuthorized(address caller);

contract ConceroTask is AutomationCompatibleInterface{
    ///////////////
    ///VARIABLES///
    ///////////////
    mapping(uint256 updateId => uint256 lastUpkeepBlock) private s_historic;
    uint256 private s_lastUpkeepBlock;
    uint256 private s_counter;

    uint256 private constant UPDATE_INTERVAL = 2;
    address private constant FORWARDED = 0xc7d6468d3fCbE7d5e46864708FCd3EA3d6920685;

    ////////////
    ///EVENTS///
    ////////////
    event ConceroTask_BlockNumberUpdated(uint256 newBlockNumber);

    ///////////////
    ///FUNCTIONS///
    ///////////////
    constructor(){
        s_lastUpkeepBlock = block.number;
        s_historic[++s_counter] = block.number;
    }

    function checkUpkeep(bytes calldata) external view override returns (bool upkeepNeeded, bytes memory){
        // if(msg.sender != FORWARDED ) revert ConceroTask_NotAuthorized(msg.sender);

        uint256 blockNumber = block.number;
        uint256 lastUpdate = s_lastUpkeepBlock;

        if(blockNumber - lastUpdate >= UPDATE_INTERVAL){
            upkeepNeeded = true;
        }
    }

    function performUpkeep(bytes calldata) external override{
        // if(msg.sender != FORWARDED ) revert ConceroTask_NotAuthorized(msg.sender);

        uint256 blockNumber = block.number;
        uint256 lastUpdate = s_lastUpkeepBlock;

        if(blockNumber - lastUpdate >= UPDATE_INTERVAL){
            s_lastUpkeepBlock = blockNumber;
            s_historic[++s_counter] = blockNumber;
        }
        emit ConceroTask_BlockNumberUpdated(s_lastUpkeepBlock);
    }

    /////////////////
    ///VIEW & PURE///
    /////////////////
    function getLastUpkeepBlock() external view returns(uint256){
        return s_lastUpkeepBlock;
    }

    function getUpdateHistoric(uint256 _updateNumber) external view returns(uint256){
        return s_historic[_updateNumber];
    }
}

