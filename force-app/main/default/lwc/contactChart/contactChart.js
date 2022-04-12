import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import chartjs from '@salesforce/resourceUrl/ChartJS';
import { loadScript } from 'lightning/platformResourceLoader';
import getContactActions from '@salesforce/apex/AuditActions.getContactActions';
import countContactactions from '@salesforce/apex/AuditActions.countContactactions';




export default class contactChart extends LightningElement {
    @track listAA;
    @track actions ;
    actions=countContactactions();
  
   chart;
   chartjsInitialized = false;
   config={
   type : 'doughnut',
   data :{
   datasets :[
   {
   data: [
   ],
   backgroundColor :[
 
   "rgb(255, 219, 81)",

    "rgb(247, 177, 69)",
 
     "rgb(161, 116, 47)"
   ],
      label:'Dataset 1'
   }
   ],
   labels:[]
   },
   options: {
    responsive : true,
legend : {
    position :'right'
},
animation:{
   animateScale: true,
   animateRotate : true
}
}
   };
   renderedCallback()
   {
      if(this.chartjsInitialized)
     {
      return;
     }
     this.chartjsInitialized = true;
     Promise.all([
      loadScript(this,chartjs)
     ]).then(() =>{
       const ctx = this.template.querySelector('canvas.donut')
       .getContext('2d');
       this.chart = new window.Chart(ctx, this.config);
     })
     .catch(error =>{
       this.dispatchEvent(
       new ShowToastEvent({
       title : 'Error loading ChartJS',
       message : error.message,
       variant : 'error',
      }),
     );
   });
   getContactActions().then((data,error) => {
    this.listAA=data;

   if(this.listAA)
   {
      for(var key in this.listAA)
       {
          this.updateChart(this.listAA[key],key);
       }
   }
  else if(error)
  {
     this.error = error;
     this.listAA = undefined;
  }

});
   }
   
   updateChart(label,count)
   {
      this.chart.data.labels.push(count);
      this.chart.data.datasets.forEach((dataset) => {
      dataset.data.push(label);
      });
      this.chart.update();
    }
}