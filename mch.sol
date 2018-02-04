pragma solidity ^0.4.18;

contract delivery{
    address [] public companies;
    address [] public deliveryPerson;
    uint256 [] public productsId;
    mapping (address=>uint256) public bids;
    mapping (address=>uint256) public balances;
    mapping (uint256=>string) public From;
    mapping (uint256=>string) public To;
    
    function joinCompanyCommunity () public {
        companies.push(msg.sender);
    }
    
    function joinAsDeliveryPerson () payable public {
        deliveryPerson.push(msg.sender);
        balances[msg.sender]+=msg.value;
    }
    
    function validDeliveryPerson(address add) private returns (bool){
        for(uint i=0; i < deliveryPerson.length; i++){
            if(deliveryPerson[i]==add){
                return true;
            }
        }
        return false;
    }
    
     function validCompany(address add) private returns (bool){
        for(uint i=0; i < companies.length; i++){
            if(companies[i]==add){
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
        }
    }
    
    function bidForProduct(uint256 money)public{
        if(validDeliveryPerson(msg.sender)==true){
            
        }
    }
    
    
    
}