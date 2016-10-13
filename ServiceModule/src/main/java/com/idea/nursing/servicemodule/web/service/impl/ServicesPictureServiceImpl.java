package com.idea.nursing.servicemodule.web.service.impl;


import com.idea.nursing.core.generic.GenericDao;
import com.idea.nursing.core.generic.GenericServiceImpl;
import com.idea.nursing.servicemodule.web.dao.ServicesPictureMapper;
import com.idea.nursing.servicemodule.web.domain.pojo.ServicesPicture;
import com.idea.nursing.servicemodule.web.domain.pojo.ServicesPictureExample;
import com.idea.nursing.servicemodule.web.service.ServicesPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ServicesPictureServiceImpl extends GenericServiceImpl<ServicesPicture, Long,ServicesPictureExample> implements ServicesPictureService {
    @Autowired
    private ServicesPictureMapper servicespictureDao;
    @Override
    public GenericDao<ServicesPicture, Long,ServicesPictureExample> getDao() {
        return servicespictureDao;
    }

}
