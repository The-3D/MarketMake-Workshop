pragma solidity 0.7.4;



interface IFlashLoanReceiver {
  function executeOperation(
    address[] calldata assets,
    uint256[] calldata amounts,
    uint256[] calldata premiums,
    address initiator,
    bytes calldata params
  ) external returns (bool);

}


interface IArbitrageStrategy {
    
     function arbitrage() external payable;
   
}


interface IWETH {
  function deposit() external payable;

  function withdraw(uint256) external;


  function approve(address guy, uint256 wad) external returns (bool);
  
 
  function transferFrom(
    address src,
    address dst,
    uint256 wad
  ) external returns (bool);
}


contract DemoFlashloanReceiver is IFlashLoanReceiver {
    
 
 address constant LENDING_POOL = 0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9;
 IWETH constant WETH = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
 IArbitrageStrategy constant STRATEGY = IArbitrageStrategy(0x8F1034CBE5827b381067fCEfA727C069c26270c4);


  function executeOperation(
    address[] calldata assets,
    uint256[] calldata amounts,
    uint256[] calldata premiums,
    address initiator,
    bytes calldata params
  ) external override returns (bool) {
    
    require(assets[0] == address(WETH), "Invalid asset");
    require(amounts[0] < 0.01 ether, "Invalid amount");
    
    //insert the code to invoke FakeArbitrageStrategy here
    
    return true;
   
  }
    
}
