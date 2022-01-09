const MedicalManagmtSys = artifacts.require("MedicalManagmtSys");

module.exports = function (deployer) {
  deployer.deploy(MedicalManagmtSys);
};
