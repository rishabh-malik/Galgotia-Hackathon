pragma solidity ^0.4.18;

contract delivery{
    address [] public companies;
    address [] public deliveryPerson;
    uint256 [] public productsId;
    mapping (uint256=>address) public IDpeBanda;
    mapping (address=>uint256) public BandeKePaise;
    mapping (address=>uint256) public balances;
    mapping (uint256=>string) public From;
    mapping (uint256=>string) public To;
    
    event status(string msgs);
    
    function joinCompanyCommunity () public {
        companies.push(msg.sender);
        status("Joined Company community");
    }
    
    function joinAsDeliveryPerson () payable public {
        deliveryPerson.push(msg.sender);
        balances[msg.sender]+=msg.value;
        status("Joined delivers community");
    }
    
    function validDeliveryPerson(address add) private returns (bool){
        for(uint i=0; i < deliveryPerson.length; i++){
            if(deliveryPerson[i]==add){
                status("valid delivery person");
                return true;
            }
        }
        return false;
    }
    
     function validCompany(address add) private returns (bool){
        for(uint i=0; i < companies.length; i++){
            if(companies[i]==add){
                status("valid company");
                return true;
            }
        }
        return false;
    }
    
    function addProduct(uint256 productid,string from,string to) public{
        if(validCompany(msg.sender)==true){
            productsId.push(productid);
            From[productid]=from;
            To[productid]=to;
            status("Product added");
        }
    }
    
    function getProducts() view public returns(uint256[]){
        return productsId;
    }
    
    function bidForProduct(uint256 money,uint256 productid)public{
        if(validDeliveryPerson(msg.sender)==true){
            IDpeBanda[productid] = msg.sender;
            BandeKePaise[msg.sender] = money;
            status("bid added");
        }
    }
    
    function getBids(uint256 productid) view public returns(uint256) {
        return BandeKePaise[IDpeBanda[productid]];
    }
    
    function getWinner(uint256 productid) view public returns(address) {
        return IDpeBanda[productid];
    }
}
