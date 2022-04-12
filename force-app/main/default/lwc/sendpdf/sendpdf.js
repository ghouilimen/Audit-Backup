import { LightningElement } from 'lwc';
import sendReport from '@salesforce/apex/AuditPdf.sendReport';
import createAndSendCSVReport from '@salesforce/apex/AuditCSV.createAndSendCSVReport';

export default class Sendpdf extends LightningElement {
    sendReportMail() {
        sendReport().then((result) => {
            const evt = new ShowToastEvent({
                title: 'Success',
                message: 'Audit envoyé par mail sous format PDF !',
                variant: 'info',
            });
            this.dispatchEvent(evt);
        }).catch(error => {
            System.debug('non');
        
        });
        }
    sendCSVMail() {
        createAndSendCSVReport().then((result) => {
            const evt = new ShowToastEvent({
                title: 'Success',
                message: 'Audit envoyé par mail sous format csv !',
                variant: 'info',
            });
            this.dispatchEvent(evt);
        }).catch(error => {
            System.debug('non');
        
        });
        }
}