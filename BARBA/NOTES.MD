# Smart Contract
- **Goal**: keeps track of the lastUpkeepBlock
  - Update it every three blocks.
- **Chainlink Integration**: Automation
- **Variable**: lastUpkeepBlock

#Chainlink Options
- **Custom Logic**
  - Somehow this method is updating up to 4-5 seconds.
    - Block interval reduced from 3 to 2.
      - Now it's working as expected.
- **Offchain data**
  - Web3.Js type of stuff.
- **Time Based**
  - Considering the Average block time of 12 seconds.
- **Log Based**
  - ??

## Ethereum
1. 0x625B15eDDce4E0c1Ae4c063c71e7136aE96783A8
   1. [Automation Upkeep](https://automation.chain.link/sepolia/96587238170519011700878546969647935012986061493536323351641631998631967111660)

## Avalanche
1. 0xdE204e9b44C65A0D9A58eb159585DCd48848B8A9
   1. [Automation Upkeep](https://automation.chain.link/fuji/113317611889029961359098918048126954540298211828800342814551742983840657420728)