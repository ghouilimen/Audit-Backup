public with sharing class ScheduleReportMail implements Schedulable {

   public void execute(SchedulableContext sc){
       AuditPdf.sendReport();
   }


    public ScheduleReportMail() {   }
}
