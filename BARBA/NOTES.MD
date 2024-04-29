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