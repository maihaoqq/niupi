package Quartz;

import com.fasterxml.jackson.databind.util.BeanUtil;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

@DisallowConcurrentExecution //只有上一个人任务执行完毕才可以执行下一次任务
public class QuartzJobFactory implements Job {
//    private static final Logger logger = LoggerFactory.getActionLog(QuartzJobFactory.class);
//    @Override
    public void execute(JobExecutionContext context){
        // TODO Auto-generated method stub
        try{
//            ScheduleJob scheduleJob = (ScheduleJob)context.getMergedJobDataMap().get("scheduleJob");
//            logger.info(scheduleJob.getJobName(),"任务开始");
//            ((TaskService) BeanUtil.getBean(scheduleJob.getJobName())).exe();
//            logger.info(scheduleJob.getJobName(),"任务结束");
        }catch(Exception e){
            e.printStackTrace();
        }
        //logger.info("任务结束", scheduleJob.getJobName());
    }

}