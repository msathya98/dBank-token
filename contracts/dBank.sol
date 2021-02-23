//assign Token contract to variable
  Token private token;
  //add mappings
 mapping(address => uint256) public etherBalanceOf;
 mapping(address => uint256) public depositStart;
 mapping(address => bool) public isDeposited;
  
  //add events
 event Deposit( address indexed user, uint etherAmount, uint timestamp);
  //pass as constructor argument deployed Token contract
  constructor(Token _token) {
    //assign token deployed contract to variable
    token = _token;

  }

  function deposit() payable public  {
    //check if msg.sender didn't already deposited funds
    //check if msg.value is >= than 0.01 ETH
    require(isDeposited[msg.sender] == false, "ERROR: Deposite already active");
    require(msg.value>=1e16, "Error, deposite must be >= 0.01 ETH");
  
  etherBalanceOf[msg.sender] += msg.value;
  depositStart[msg.sender] += block.timestamp;

  isDeposited[msg.sender] = true;

  emit Deposit(msg.sender, msg.value, block.timestamp);


    //increase msg.sender ether deposit balance
    //start msg.sender hodling time

    //set msg.sender deposit status to true
    //emit Deposit event
  }
}
