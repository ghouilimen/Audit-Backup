import { LightningElement, api } from 'lwc';
import chartjs from '@salesforce/resourceUrl/ChartJs';
import { loadScript } from 'lightning/platformResourceLoader';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ActionAudit extends LightningElement {
    @api chartConfig;
 
    isChartJsInitialized;

    renderedCallback() {
        if (this.isChartJsInitialized) {
            return;
        }
        // load chartjs from the static resource
        Promise.all([loadScript(this, chartjs)])
            .then(() => {
                this.isChartJsInitialized = true;
                const ctx = this.template.querySelector('canvas.barChart').getContext('2d');
                this.chart = new window.Chart(ctx, JSON.parse(JSON.stringify(this.chartConfig)));
                ctx.onclick=this.clickHandler;
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error loading Chart',
                        message: error.message,
                        variant: 'error',
                    })
                );
            });
        }

   clickHandler(click) {
       const points = this.chart.getElementsAtEventForMode(click, 'nearest',{intersect: true }, true);
       if (points.length) {
           const firstPoint = points[0];
           console.log(firstPoint);
           const value= this.chart.data.datasets[firstPoint.datasetIndex].data[firstPoint.index];
           console.log(value);
           window.open('https://www.google.com', '_blank');
       }
   }

}