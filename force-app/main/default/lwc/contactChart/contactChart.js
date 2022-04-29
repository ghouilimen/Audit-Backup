import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import chartjs from '@salesforce/resourceUrl/ChartJS';
import { loadScript } from 'lightning/platformResourceLoader';
import getContactActions from '@salesforce/apex/AuditActions.getContactActions';




export default class contactChart extends LightningElement {
    @track listAA;
  
   chart;
   chartjsInitialized = false;
   config={
   type : 'doughnut',
   data :{
   datasets :[
   {
   data: [
   ],
   backgroundColor:  [
      'rgba(255, 99, 132, 0.2)',
      'rgba(75, 192, 192, 0.2)',
      'rgba(153, 102, 255, 0.2)',
      
      ],

      borderColor: [
          'rgb(255, 99, 132)',
          'rgb(75, 192, 192)',
          'rgb(153, 102, 255)',
         ],
   }
   ],
   labels:[]
   },
   options: {
    responsive : true,
    plugins: {
      title: {
          display: true,
          text: 'Custom Chart Title'
      }
  },
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
       this.chart = new window.Chart(ctx, this.config );
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