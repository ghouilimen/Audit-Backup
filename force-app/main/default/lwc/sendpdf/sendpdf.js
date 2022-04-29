import { LightningElement } from 'lwc';
import sendReport from '@salesforce/apex/AuditPdf.sendReport';
import createAndSendCSVReport from '@salesforce/apex/AuditCSV.createAndSendCSVReport';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import bootstrap from '@salesforce/resourceUrl/bootstrap';
import jquerymin from '@salesforce/resourceUrl/jquerymin';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';
import PDFimg from '@salesforce/resourceUrl/PDFimg';


export default class Sendpdf extends NavigationMixin(LightningElement) {
    img =PDFimg ;
    renderedCallback() {
        Promise.all([
            loadScript(this, bootstrap + '/bootstrap-5.1.3-dist/js/bootstrap.js'),
            loadScript(this, jquerymin),
            loadStyle(this, bootstrap + '/bootstrap-5.1.3-dist/css/bootstrap.css')
        ])
            .then(() => {
                console.log("All scripts and CSS are loaded. perform any initialization function.")
            })
            .catch(error => {
                console.log("failed to load the scripts");
            });
    }
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