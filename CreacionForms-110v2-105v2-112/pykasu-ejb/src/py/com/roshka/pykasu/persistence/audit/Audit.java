package py.com.roshka.pykasu.persistence.audit;


import javax.persistence.PostPersist;
import javax.persistence.PrePersist;

import org.apache.log4j.jdbc.JDBCAppender;


import py.com.roshka.pykasu.interfaces.Auditable;

public class Audit{
	
	static org.apache.log4j.Logger audit = org.apache.log4j.Logger
			.getLogger(Audit.class);

//	static {
//		JDBCAppender jdbca = new JDBCAppender();
//
//		jdbca.setDriver("org.postgresql.Driver");
//		jdbca.setUser("pwelti");
//		jdbca.setPassword("maggie");
//		jdbca.setURL("jdbc:postgresql://localhost:5432/pykasu");
//		jdbca.setSql("insert into audit (fecha, user_name, action_detail) values ('%d{ISO8601}', 'pwelti','\"%m\"')");
//		
//		audit.addAppender(jdbca);	
//	}

	@PostPersist
	public void postPersist(Auditable auditObject){
		
		audit.info("postPersist" + auditObject.getClass());
//		audit.info(auditObject.toAudit());
		
//		audit.info("Audit Post Persist Event");
//		if(auditObject==null){
//			audit.error("Audit object is null!");
//			
//		}else{
//			audit.info("Audit Object: " + auditObject.getClass());
//			AuditData auditDetail = new AuditData();
//			auditDetail.setAction(AuditAction.INSERT);
//			auditDetail.setActionDetail(auditObject.toAudit());
//			auditDetail.setUserName("pwelti");
//			auditDetail.setTimeStamp(new Date(System.currentTimeMillis()));
//			auditDetail.persist();
//		}
	}
	@PrePersist
	public void prePersist(Auditable auditObject){
		audit.info("prePersist" + auditObject.getClass());
	}
}
