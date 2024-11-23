module.exports = async function (context, myBlob) {
    let fileName = context.bindingData.blobTrigger;
    context.log("JavaScript blob trigger function processed blob \n Blob:", context.bindingData.blobTrigger, "\n Blob Size:", myBlob.length); 
    const Axios = require('axios').default;
    const FormData = require('form-data');
    
    const deleteBlob = async()=>{
        console.log('Deleting Blob',fileName);
        fileName = String(fileName).replace('raw/',''); 
        const { BlobServiceClient } = require('@azure/storage-blob'); 
        const storageConn = process.env["Data_Lake_Connection"];
        const blobServiceClient = BlobServiceClient.fromConnectionString(storageConn);
        const containerClient = blobServiceClient.getContainerClient('raw');
        await containerClient.deleteBlob(fileName);
        console.log('Blob deleted',fileName); 
    };
    
    const formData = new FormData();
    formData.append('file',myBlob,'testfile');
    try {
        let response = await Axios.post(process.env["AV_Scan_Endpoint"],formData,{
            headers: formData.getHeaders()
        });
        let resp = String(response.data).indexOf('Status: "OK"') >=0;
        console.log('Clamav response',response.data,resp);
        if(resp){
            console.log('File',fileName, 'is clean.')
        }else{
            await deleteBlob(fileName);
        }
    } catch(e){ 
            console.log('CLAMAV API ERROR',e.message);
            await deleteBlob(fileName);
    } 
};