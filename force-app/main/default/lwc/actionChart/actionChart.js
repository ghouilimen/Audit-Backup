import { LightningElement, wire } from 'lwc';
import getActions from '@salesforce/apex/AuditActions.getActions';

export default class ActionChart extends LightningElement {
    chartConfiguration;
 
    @wire(getActions)
    getActions({ error, data }) {
        if (error) {
            this.error = error;
            this.chartConfiguration = undefined;
        } else if (data) {
            let ActionsNumber = [];
            let ObjectNames = [];
            

            for (let i=0; i<(data.length/2); i++){

                ObjectNames.push(data[i]);
                ActionsNumber.push(data[i+(data.length/2)]);
            }
 
            this.chartConfiguration = {
                type: 'bar',
                data: {
                    datasets: [{
                        label: 'Total Actions',
                        data: ActionsNumber,
                        backgroundColor:  [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            ],

                            borderColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 159, 64)',
                                'rgb(75, 192, 192)',
                                'rgb(54, 162, 235)',
                                'rgb(153, 102, 255)',
                                'rgb(255, 205, 86)',
                              ],
                            borderWidth: 1
                    },{
                        label: ' Actions number',
                        data: ActionsNumber,
                        backgroundColor:  [
                            'rgba(255, 26, 104, 0.0)',              
                            ],

                            borderColor: [
                                'rgba(255, 26,104, 1)',
                                
                              ],
                            tension: 0.4,
                            type: 'line'
                    }
                ],
                        labels: ObjectNames,
                    },
                            
                options: {
                    indexAxis: 'y',
                },
            };
            console.log('data => ', data);
            this.error = undefined;
        }
    }
    
}