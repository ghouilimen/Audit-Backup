import { track,LightningElement } from 'lwc';
import chartResource from '@salesforce/resourceUrl/ChartJS';
import { loadScript } from 'lightning/platformResourceLoader';
import getContactActions from '@salesforce/apex/AuditActions.getContactActions';
import getContractActions from '@salesforce/apex/AuditActions.getContractActions';
import getLeadActions from '@salesforce/apex/AuditActions.getLeadActions';
import getOpportunityActions from '@salesforce/apex/AuditActions.getOpportunityActions';
import getProductActions from '@salesforce/apex/AuditActions.getProductActions';
import getAccountActions from '@salesforce/apex/AuditActions.getAccountActions';




export default class ChartExampleLWC extends LightningElement {

    @track listAA;
    @track listBB;


connectedCallback(){
    this.loadChartResource();
    console.log('boo')
}

loadChartResource(){
    loadScript(this, chartResource )
    .then(() => {
     this.callRadarChart();
    })
    .catch((error) => {
      console.log("Error:", error);
    });
    

}



    callRadarChart(){
      const config = {
          type: "radar",
          data: {
            datasets: [
              { label: "Contact",
                data: [],
                borderColor: [
                  "rgb(255, 99, 132)",
                 ],
                backgroundColor: [
                  "rgba(255, 99, 132, 0.2)",                
                  ],
              },
              { label: "Contract",
                data: [],
                borderColor: [
                  'rgb(255, 159, 64)',
                 ],
                backgroundColor: [
                  'rgba(255, 159, 64, 0.2)',
                  
                  ],
              },
               { label: "Lead",
                data: [],
                borderColor: [
                  'rgb(75, 192, 192)',
                 ],
                backgroundColor: [
                  'rgba(75, 192, 192, 0.2)',
                  
                  ],
              },
              { label: "Opportunity",
                data: [],
                borderColor: [
                  'rgb(54, 162, 235)',
                 ],
                backgroundColor: [
                  'rgba(54, 162, 235, 0.2)',
                  
                  ],
              },
              { label: "Account",
                data: [],
                borderColor: [
                  'rgb(153, 102, 255)',
                 ],
                backgroundColor: [
                  'rgba(153, 102, 255, 0.2)',
                  
                  ],
              },
              { label: "Product",
                data: [],
                borderColor: [
                  'rgb(255, 205, 86)',
                 ],
                backgroundColor: [
                  'rgba(255, 205, 86, 0.2)',
                  
                  ],
              },
              
            ],
            labels: []
          },
          options: {
            responsive: true,
            legend: {
              display: true,
            },
            animation: {
              animateScale: true,
              animateRotate: true
            },
            title: {
              display: true,
              text: "Actions Per object"
            },
            tooltips: {
              callbacks: {
                label: function(tooltipItem, data) {
                  return data.datasets[tooltipItem.datasetIndex].label + ": " + tooltipItem.yLabel;
                }
              }
            }
          }
        };
        getContractActions().then((data,error) => {
          this.listAA=data;
      
         if(this.listAA)
         {
            for(var key in this.listAA)
             {
                this.updateChart(this.listAA[key],key,1);
             }
         }
        else if(error)
        {
           this.error = error;
           this.listAA = undefined;
        }
      
      });
      getContactActions().then((data,error) => {
        this.listAA=data;
    
       if(this.listAA)
       {
          for(var key in this.listAA)
           {
              this.updateChart(this.listAA[key],key,0);
           }
       }
      else if(error)
      {
         this.error = error;
         this.listAA = undefined;
      }
    
    });
      getLeadActions().then((data,error) => {
        this.listAA=data;
    
      if(this.listAA)
      {
          for(var key in this.listAA)
          {
              this.updateChart(this.listAA[key],key,2);
          }
      }
      else if(error)
      {
        this.error = error;
        this.listAA = undefined;
      }
    
    });
      getOpportunityActions().then((data,error) => {
        this.listAA=data;

      if(this.listAA)
      {
          for(var key in this.listAA)
          {
              this.updateChart(this.listAA[key],key,3);
          }
      }
      else if(error)
      {
        this.error = error;
        this.listAA = undefined;
      }

    });
    getAccountActions().then((data,error) => {
      this.listAA=data;

    if(this.listAA)
    {
        for(var key in this.listAA)
        {
            this.updateChart(this.listAA[key],key,4);
        }
    }
    else if(error)
    {
      this.error = error;
      this.listAA = undefined;
    }

    });
    getAccountActions().then((data,error) => {
      this.listAA=data;

    if(this.listAA)
    {
        for(var key in this.listAA)
        {
            this.updateChart(this.listAA[key],key,5);
        }
    }
    else if(error)
    {
      this.error = error;
      this.listAA = undefined;
    }

    });
     
        this.insertToDOM("div.radarChart",config);
      }
      updateChart(count,label,position)
   {
      if(this.chart.data.labels.indexOf(label)===-1){
        this.chart.data.labels.push(label);
      }
      this.chart.data.datasets[position].data.push(count);
      this.chart.update();
    }
     


      insertToDOM(divclass,config) {
        const canvas = document.createElement("canvas");
        const chartNode = this.template.querySelector(divclass);
        chartNode.innerHTML = "";
        chartNode.appendChild(canvas);
        const ctx = canvas.getContext("2d");
        this.chart = new window.Chart(ctx, config);
        console.log('hi bcs jsb')

      }

}