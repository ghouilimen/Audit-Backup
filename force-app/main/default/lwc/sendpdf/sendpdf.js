import { LightningElement } from 'lwc';
import sendReport from '@salesforce/apex/AuditPdf.sendReport';
import createAndSendCSVReport from '@salesforce/apex/AuditCSV.createAndSendCSVReport';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import PDFimg from '@salesforce/resourceUrl/PDFimg';


export default class Sendpdf extends NavigationMixin(LightningElement) {
    img =PDFimg ;
    
    Preview(){
        this[NavigationMixin.Navigate]({
            type:"standard__webPage",
            attributes:{
                
                url:'https://wise-wolf-n2hypj-dev-ed--c.visualforce.com/apex/AuditPdf'
            
            }
        })
    }
    
    sendReportMail() {
        sendReport().then((result) => {
            this.dispatchEvent(

                new ShowToastEvent({

                    title: 'Success',

                    message: 'Audit envoyé par mail sous format PDF !',

                    variant: 'success'

                })

            );

        })
        }
    sendCSVMail() {
        createAndSendCSVReport().then((result) => {
            this.dispatchEvent(

                new ShowToastEvent({

                    title: 'Success',

                    message: 'Audit envoyé par mail sous format csv !',

                    variant: 'success'

                })

            );

        })
}}