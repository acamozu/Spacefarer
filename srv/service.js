// CRUD OPERATIONS
// TESTED ON POSTMAN


/*const cds = require('@sap/cds');
const { Spacefarer } = cds.entities("spacefarer.cap.db");
const nodemailer = require('nodemailer');


module.exports = srv => {
         srv.on("READ", "ReadSpacefarer", async (req, res) => {
            const aFilter = req.query.SELECT.where;
    
            if (typeof aFilter !== "undefined")
                return await SELECT.from(Spacefarer).where(aFilter);
    
            return await SELECT.from(Spacefarer);
        });
    
        srv.on("CREATE", "UpdateSpacefarer", async (req, res) => {
            let firstname = req.data.first_name;
            let lastname = req.data.last_name;
            let eMail = req.data.email
    
            let returnData = await cds
                .transaction(req)
                .run([
                    UPDATE(Spacefarer)
                        .set({
                            first_name: firstname
                        })
                        .where({ email: eMail })
                ], [
                    UPDATE(Spacefarer)
                        .set({
                            last_name: lastname
                        })
                        .where({ email: eMail })
                ])
                .then((resolve, reject) => {
                    console.log("resolve:", resolve);
                    console.log("reject:", reject);
    
                    if (typeof resolve !== "undefined") {
                        return req.data;
                    } else {
                        req.error(500, "DATA NOT FOUND");
                    }
                })
                .catch(err => {
                    console.log(err);
                    req.error(500, "Error in UPDATE");
                });
            console.log("POST DATA:\n", returnData);
            return returnData;
    
        });
    
        srv.before("CREATE", "InsertSpacefarer", async (req, res) => {
            console.log("BEFORE CREATE DATA\n", req.data);
            let startdust_status = req.data.stardust_collection_status_code,
                navigation_skill = req.data.wormhole_navigation_skill_code
            if (startdust_status && navigation_skill) {
                if (startdust_status === "L") {
                    req.data.stardust_collection_status_code = "M";
                }
                if (navigation_skill === "B") {
                    req.data.wormhole_navigation_skill_code = "G";
                }
            }
            else {
                req.error(500, "NOT READY TO BE A SPACEFARER");
            }
        });
    
        srv.on("CREATE", "InsertSpacefarer", async (req, res) => {
            let returnData = await cds
                .transaction(req)
                .run(
                    INSERT.into(Spacefarer).entries({
                        ID: req.data.ID,
                        email: req.data.email,
                        first_name: req.data.first_name,
                        last_name: req.data.last_name,
                        stardust_collection_status_code: req.data.stardust_collection_status_code,
                        wormhole_navigation_skill_code: req.data.wormhole_navigation_skill_code
                    })
                )
                .then((resolve, reject) => {
                    console.log("resolve:", resolve);
                    console.log("reject:", reject);
    
                    if (typeof resolve !== "undefined") {
                        return req.data;
                    } else {
                        req.error(500, "DATA NOT FOUND");
                    }
                })
                .catch(err => {
                    console.log(err);
                    req.error(500, "Error in CREATE");
                });
            console.log("CREATE DATA:\n", returnData);
            return returnData;
        });
    
        srv.after("CREATE", "InsertSpacefarer", async (req, res) => {
            let email = req.email;
            console.log("NEW EMAIL CREATED: ", email);
    
            let transporter = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: 'acamozu1@gmail.com',
                    pass: '***********'
                }
            });
    
            var mailOptions = {
                from: 'acamozu1@gmail.com',
                to: email,
                subject: 'WELCOME NEW SPACEFARER',
                text: 'ALDI WISHES YOU THE VERY BEST!(HOPE YOU GOT IT;)'
            };
    
    
            transporter.sendMail(mailOptions, function (error, info) {
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
    
        });
    
        srv.on("CREATE", "DeleteSpacefarer", async (req, res) => {
            let returnData = await cds
                .transaction(req)
                .run(
                    DELETE.from(Spacefarer).where({
                        ID: req.data.ID
                    })
                )
                .then((resolve, reject) => {
                    console.log("resolve:", resolve);
                    console.log("reject:", reject);
    
                    if (typeof resolve !== "undefined") {
                        return req.data;
                    } else {
                        req.error(500, "DATA NOT FOUND");
                    }
                })
                .catch(err => {
                    console.log(err);
                    req.error(500, "Error in DELETE");
                });
            console.log("DELETE DATA:\n", returnData);
            return returnData;
        }); 
};*/