import { LightningElement } from 'lwc';
import sendReport from '@salesforce/apex/ContractPdf.sendReport';


export default class Contractpdf extends LightningElement {
    sendReportMail() {
        sendReport().then((result) => {
            const evt = new ShowToastEvent({
                title: 'Success',
                message: 'Audit envoyé par mail sous format PDF !',
                variant: 'info',
            });
            this.dispatchEvent(evt);
        }).catch(error => {
        
        });
        }
}