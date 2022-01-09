const Appointment = artifacts.require("Appointment")

contract("Appointment", (accounts) =>{
    before(async() => {
        instance = await Appointment.deployed()
    })

    it('ensures the total number of doctors are 30', async() =>{
        let balance = await instance.appointleft()
        assert.equal
    })
})