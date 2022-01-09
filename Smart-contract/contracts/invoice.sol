// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MedStore {
    
    struct MedicalStore {
        address owner;
        string ownerName;
        string storeName;
        string pno;
        string ownerAddress;
        uint256 invoices;
        uint256 purchases;
        bool exists;
    }
    
    struct Medicine {
        string name;
        uint256 rate;
        uint256 price;
        uint256 quantity;
        string bno;
        string manufactDate;
        string expiryDate;
        bool exists;
    }
    

    mapping(address => mapping(string => Medicine)) public medicines;
 
    mapping(address => mapping(uint256 => string)) public batchIdOfMedicine;
    
    mapping(address => uint256) public medicineCountInMedicalStore;

    mapping(address => mapping(uint256 => Medicine)) public myMedicines;

    mapping(address => MedicalStore) public medicalStores;

    mapping(address => MedicalStore) public myMedicalStores;

    mapping(address => mapping(uint256 => string)) public myBills;

    mapping(address => uint256) public myBillsCount;

    mapping(address => mapping(uint256 => string)) public myInvoices;

    mapping(address => uint256) public myInvoicesCount;

    uint256 public medicalStoresCount;

    // function to add new medical store
    function addMedicalStore(string memory _ownerName, string memory _medicalStoreName, string memory _pno, string memory _ownerAddress) public {
        require(medicalStores[msg.sender].exists == false, "Medical store name already exists");
        
        medicalStoresCount++;
        medicalStores[msg.sender] = MedicalStore(msg.sender, _ownerName, _medicalStoreName, _pno, _ownerAddress, 0, 0, true);
        myMedicalStores[msg.sender] = MedicalStore(msg.sender, _ownerName, _medicalStoreName, _pno, _ownerAddress, 0, 0, true);
    }

    // function to add new stock of a specific medicine having a particular expiry date to a particular medical store
    function addMedicine( string memory _medicineName, uint256 _rate, uint256 _price, uint256 _quantity, string memory _bno, string memory _manufactDate, string memory _expiryDate) public {
        require(_quantity > 0, "Quantity should be greater than 0");
        medicineCountInMedicalStore[msg.sender]++;
        myMedicines[msg.sender][medicineCountInMedicalStore[msg.sender]] = Medicine(_medicineName, _rate, _price, _quantity, _bno, _manufactDate, _expiryDate, true);
        batchIdOfMedicine[msg.sender][ medicineCountInMedicalStore[msg.sender]] = _bno;
        medicines[msg.sender][_bno] = Medicine(_medicineName, _rate, _price, _quantity, _bno, _manufactDate, _expiryDate, true);

        medicalStores[msg.sender].invoices++;
        myMedicalStores[msg.sender].invoices++;
    }

    function purchaseMedicine( uint256 _quantity, string memory _bno) public {
        require(medicines[msg.sender][_bno].quantity > 0, "Insufficient stock");
        require(_quantity > 0, "Quantity should be greater than 0");
        
        medicines[msg.sender][_bno].quantity -= _quantity;
        medicalStores[msg.sender].purchases++;
        myMedicalStores[msg.sender].purchases++;
    }

    function addBills(string memory _billHash) public {
        myBillsCount[msg.sender]++;
        myBills[msg.sender][myBillsCount[msg.sender]] = _billHash;
    }

    function addInvoices(string memory _invoiceHash) public {
        myInvoicesCount[msg.sender]++;
        myInvoices[msg.sender][myInvoicesCount[msg.sender]] = _invoiceHash;
    }
 
    function medicineCount() view public returns(uint256){
        return medicineCountInMedicalStore[msg.sender];
    }

    function invoicesCount() view public returns(uint256){
        return myMedicalStores[msg.sender].invoices;
    }
    function purchasesCount() view public returns(uint256){
        return myMedicalStores[msg.sender].purchases;
    }
    
}