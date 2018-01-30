package com.easywork.hengdong.pojo;

import javax.persistence.*;

public class Enterprise {
    @Id
    private Integer id;

    /**
     * 企业名称 :被评价企业名称 
     */
    @Column(name = "enterprise_name")
    private String enterpriseName;

    /**
     * 组织机构代码 : 
     */
    @Column(name = "organization_code")
    private String organizationCode;

    /**
     * 企业 济类型代码 : 
     */
    @Column(name = "enterprise_economic_type_code")
    private String enterpriseEconomicTypeCode;

    /**
     * 国家行政区划名称 : 
     */
    @Column(name = "country_subdivision_name")
    private String countrySubdivisionName;

    /**
     * 国家行政区划代码 : 
     */
    @Column(name = "country_subdivision_code")
    private String countrySubdivisionCode;

    /**
     * 联系人名称 :企业联系人姓名 
     */
    @Column(name = "contact_name")
    private String contactName;

    /**
     * 电话号码 : 
     */
    @Column(name = "telephone_number")
    private String telephoneNumber;

    /**
     * 传真号码 : 
     */
    @Column(name = "fax_number")
    private String faxNumber;

    /**
     * 通讯地址 :企业通讯地址 
     */
    @Column(name = "communication_number")
    private String communicationNumber;

    /**
     * 邮政标识代码 :企业邮政编码 
     */
    @Column(name = "postal_identification_code")
    private String postalIdentificationCode;

    /**
     * 电子邮件地址 :企业电子邮件地址 
     */
    private String email;

    /**
     * 网络访问地址 :企业网址 
     */
    @Column(name = "network_access_address")
    private String networkAccessAddress;

    /**
     * 企业注册号 :  
     */
    @Column(name = "enterprise_registration_number")
    private String enterpriseRegistrationNumber;

    /**
     * 企业注册地址 :住所 
     */
    @Column(name = "enterprise_registration_address")
    private String enterpriseRegistrationAddress;

    /**
     * 法定代表人 :法定代表人姓名 
     */
    @Column(name = "legal_representative")
    private String legalRepresentative;

    /**
     * 公司类型 :依据股东对公司承担责任形式的不同对公司类型的分类 
     */
    @Column(name = "company_type")
    private String companyType;

    /**
     * 营范围 :企业 营范围 
     */
    @Column(name = "business_scope")
    private String businessScope;

    /**
     * 注册资本 :企业登记注册时的资本 
     */
    @Column(name = "registered_capital")
    private String registeredCapital;

    /**
     * 成立日期 : 
     */
    @Column(name = "establishment_date")
    private String establishmentDate;

    /**
     * 期限开始日期 :营业执照有效期开始日期 
     */
    @Column(name = "period_start_date")
    private String periodStartDate;

    /**
     * 期限结束日期 :营业执照有效期截止日期 
     */
    @Column(name = "period_end_date")
    private String periodEndDate;

    /**
     * 发证单位 :营业执照的颁发单位 
     */
    @Column(name = "certification_unit")
    private String certificationUnit;

    /**
     * 照片 :营业执照的扫 照片名称（含路径） 
     */
    @Column(name = "business_business_photo")
    private String businessBusinessPhoto;

    /**
     * 许可证编号 :道路运输 营许可证编号 
     */
    @Column(name = "permit_number")
    private String permitNumber;

    /**
     * 地点/位置 :企业 营地点 
     */
    @Column(name = "place_or_location")
    private String placeOrLocation;

    /**
     * 营范围 :企业 营范围 
     */
    @Column(name = "transport_business_scope")
    private String transportBusinessScope;

    /**
     * 许可证发放日期 :YYYYMMDD 
     */
    @Column(name = "permit_grant_date")
    private String permitGrantDate;

    /**
     * 期限开始日期 :道路运输 营许可证有效期开始日期 
     */
    @Column(name = "transport_period_start_date")
    private String transportPeriodStartDate;

    /**
     * 期限结束日期 :道路运输 营许可证有效期截止日期 
     */
    @Column(name = "transport_period_end_date")
    private String transportPeriodEndDate;

    /**
     * 发证单位 : 
     */
    @Column(name = "transport_certification_unit")
    private String transportCertificationUnit;

    /**
     * 照片 :道路运输 营许可证的扫 照片名称（含路径） 
     */
    @Column(name = "transport_photo")
    private String transportPhoto;

    /**
     * 自有货运车辆数 :企业自有货运车辆的数
     */
    @Column(name = "own_cargo_vehicles_number")
    private String ownCargoVehiclesNumber;

    /**
     * 运力规模 :运输企业的运输能力大小 
     */
    @Column(name = "transport_capacity_scale")
    private String transportCapacityScale;

    /**
     * 职工人数 :企业职工的人数 
     */
    @Column(name = "workers_number")
    private String workersNumber;

    /**
     * 备注 :业务信息的附加说明 
     */
    private String remark;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取企业名称 :被评价企业名称 
     *
     * @return enterprise_name - 企业名称 :被评价企业名称 
     */
    public String getEnterpriseName() {
        return enterpriseName;
    }

    /**
     * 设置企业名称 :被评价企业名称 
     *
     * @param enterpriseName 企业名称 :被评价企业名称 
     */
    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    /**
     * 获取组织机构代码 : 
     *
     * @return organization_code - 组织机构代码 : 
     */
    public String getOrganizationCode() {
        return organizationCode;
    }

    /**
     * 设置组织机构代码 : 
     *
     * @param organizationCode 组织机构代码 : 
     */
    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode;
    }

    /**
     * 获取企业 济类型代码 : 
     *
     * @return enterprise_economic_type_code - 企业 济类型代码 : 
     */
    public String getEnterpriseEconomicTypeCode() {
        return enterpriseEconomicTypeCode;
    }

    /**
     * 设置企业 济类型代码 : 
     *
     * @param enterpriseEconomicTypeCode 企业 济类型代码 : 
     */
    public void setEnterpriseEconomicTypeCode(String enterpriseEconomicTypeCode) {
        this.enterpriseEconomicTypeCode = enterpriseEconomicTypeCode;
    }

    /**
     * 获取国家行政区划名称 : 
     *
     * @return country_subdivision_name - 国家行政区划名称 : 
     */
    public String getCountrySubdivisionName() {
        return countrySubdivisionName;
    }

    /**
     * 设置国家行政区划名称 : 
     *
     * @param countrySubdivisionName 国家行政区划名称 : 
     */
    public void setCountrySubdivisionName(String countrySubdivisionName) {
        this.countrySubdivisionName = countrySubdivisionName;
    }

    /**
     * 获取国家行政区划代码 : 
     *
     * @return country_subdivision_code - 国家行政区划代码 : 
     */
    public String getCountrySubdivisionCode() {
        return countrySubdivisionCode;
    }

    /**
     * 设置国家行政区划代码 : 
     *
     * @param countrySubdivisionCode 国家行政区划代码 : 
     */
    public void setCountrySubdivisionCode(String countrySubdivisionCode) {
        this.countrySubdivisionCode = countrySubdivisionCode;
    }

    /**
     * 获取联系人名称 :企业联系人姓名 
     *
     * @return contact_name - 联系人名称 :企业联系人姓名 
     */
    public String getContactName() {
        return contactName;
    }

    /**
     * 设置联系人名称 :企业联系人姓名 
     *
     * @param contactName 联系人名称 :企业联系人姓名 
     */
    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    /**
     * 获取电话号码 : 
     *
     * @return telephone_number - 电话号码 : 
     */
    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    /**
     * 设置电话号码 : 
     *
     * @param telephoneNumber 电话号码 : 
     */
    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }

    /**
     * 获取传真号码 : 
     *
     * @return fax_number - 传真号码 : 
     */
    public String getFaxNumber() {
        return faxNumber;
    }

    /**
     * 设置传真号码 : 
     *
     * @param faxNumber 传真号码 : 
     */
    public void setFaxNumber(String faxNumber) {
        this.faxNumber = faxNumber;
    }

    /**
     * 获取通讯地址 :企业通讯地址 
     *
     * @return communication_number - 通讯地址 :企业通讯地址 
     */
    public String getCommunicationNumber() {
        return communicationNumber;
    }

    /**
     * 设置通讯地址 :企业通讯地址 
     *
     * @param communicationNumber 通讯地址 :企业通讯地址 
     */
    public void setCommunicationNumber(String communicationNumber) {
        this.communicationNumber = communicationNumber;
    }

    /**
     * 获取邮政标识代码 :企业邮政编码 
     *
     * @return postal_identification_code - 邮政标识代码 :企业邮政编码 
     */
    public String getPostalIdentificationCode() {
        return postalIdentificationCode;
    }

    /**
     * 设置邮政标识代码 :企业邮政编码 
     *
     * @param postalIdentificationCode 邮政标识代码 :企业邮政编码 
     */
    public void setPostalIdentificationCode(String postalIdentificationCode) {
        this.postalIdentificationCode = postalIdentificationCode;
    }

    /**
     * 获取电子邮件地址 :企业电子邮件地址 
     *
     * @return email - 电子邮件地址 :企业电子邮件地址 
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置电子邮件地址 :企业电子邮件地址 
     *
     * @param email 电子邮件地址 :企业电子邮件地址 
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取网络访问地址 :企业网址 
     *
     * @return network_access_address - 网络访问地址 :企业网址 
     */
    public String getNetworkAccessAddress() {
        return networkAccessAddress;
    }

    /**
     * 设置网络访问地址 :企业网址 
     *
     * @param networkAccessAddress 网络访问地址 :企业网址 
     */
    public void setNetworkAccessAddress(String networkAccessAddress) {
        this.networkAccessAddress = networkAccessAddress;
    }

    /**
     * 获取企业注册号 :  
     *
     * @return enterprise_registration_number - 企业注册号 :  
     */
    public String getEnterpriseRegistrationNumber() {
        return enterpriseRegistrationNumber;
    }

    /**
     * 设置企业注册号 :  
     *
     * @param enterpriseRegistrationNumber 企业注册号 :  
     */
    public void setEnterpriseRegistrationNumber(String enterpriseRegistrationNumber) {
        this.enterpriseRegistrationNumber = enterpriseRegistrationNumber;
    }

    /**
     * 获取企业注册地址 :住所 
     *
     * @return enterprise_registration_address - 企业注册地址 :住所 
     */
    public String getEnterpriseRegistrationAddress() {
        return enterpriseRegistrationAddress;
    }

    /**
     * 设置企业注册地址 :住所 
     *
     * @param enterpriseRegistrationAddress 企业注册地址 :住所 
     */
    public void setEnterpriseRegistrationAddress(String enterpriseRegistrationAddress) {
        this.enterpriseRegistrationAddress = enterpriseRegistrationAddress;
    }

    /**
     * 获取法定代表人 :法定代表人姓名 
     *
     * @return legal_representative - 法定代表人 :法定代表人姓名 
     */
    public String getLegalRepresentative() {
        return legalRepresentative;
    }

    /**
     * 设置法定代表人 :法定代表人姓名 
     *
     * @param legalRepresentative 法定代表人 :法定代表人姓名 
     */
    public void setLegalRepresentative(String legalRepresentative) {
        this.legalRepresentative = legalRepresentative;
    }

    /**
     * 获取公司类型 :依据股东对公司承担责任形式的不同对公司类型的分类 
     *
     * @return company_type - 公司类型 :依据股东对公司承担责任形式的不同对公司类型的分类 
     */
    public String getCompanyType() {
        return companyType;
    }

    /**
     * 设置公司类型 :依据股东对公司承担责任形式的不同对公司类型的分类 
     *
     * @param companyType 公司类型 :依据股东对公司承担责任形式的不同对公司类型的分类 
     */
    public void setCompanyType(String companyType) {
        this.companyType = companyType;
    }

    /**
     * 获取营范围 :企业 营范围 
     *
     * @return business_scope - 营范围 :企业 营范围 
     */
    public String getBusinessScope() {
        return businessScope;
    }

    /**
     * 设置营范围 :企业 营范围 
     *
     * @param businessScope 营范围 :企业 营范围 
     */
    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope;
    }

    /**
     * 获取注册资本 :企业登记注册时的资本 
     *
     * @return registered_capital - 注册资本 :企业登记注册时的资本 
     */
    public String getRegisteredCapital() {
        return registeredCapital;
    }

    /**
     * 设置注册资本 :企业登记注册时的资本 
     *
     * @param registeredCapital 注册资本 :企业登记注册时的资本 
     */
    public void setRegisteredCapital(String registeredCapital) {
        this.registeredCapital = registeredCapital;
    }

    /**
     * 获取成立日期 : 
     *
     * @return establishment_date - 成立日期 : 
     */
    public String getEstablishmentDate() {
        return establishmentDate;
    }

    /**
     * 设置成立日期 : 
     *
     * @param establishmentDate 成立日期 : 
     */
    public void setEstablishmentDate(String establishmentDate) {
        this.establishmentDate = establishmentDate;
    }

    /**
     * 获取期限开始日期 :营业执照有效期开始日期 
     *
     * @return period_start_date - 期限开始日期 :营业执照有效期开始日期 
     */
    public String getPeriodStartDate() {
        return periodStartDate;
    }

    /**
     * 设置期限开始日期 :营业执照有效期开始日期 
     *
     * @param periodStartDate 期限开始日期 :营业执照有效期开始日期 
     */
    public void setPeriodStartDate(String periodStartDate) {
        this.periodStartDate = periodStartDate;
    }

    /**
     * 获取期限结束日期 :营业执照有效期截止日期 
     *
     * @return period_end_date - 期限结束日期 :营业执照有效期截止日期 
     */
    public String getPeriodEndDate() {
        return periodEndDate;
    }

    /**
     * 设置期限结束日期 :营业执照有效期截止日期 
     *
     * @param periodEndDate 期限结束日期 :营业执照有效期截止日期 
     */
    public void setPeriodEndDate(String periodEndDate) {
        this.periodEndDate = periodEndDate;
    }

    /**
     * 获取发证单位 :营业执照的颁发单位 
     *
     * @return certification_unit - 发证单位 :营业执照的颁发单位 
     */
    public String getCertificationUnit() {
        return certificationUnit;
    }

    /**
     * 设置发证单位 :营业执照的颁发单位 
     *
     * @param certificationUnit 发证单位 :营业执照的颁发单位 
     */
    public void setCertificationUnit(String certificationUnit) {
        this.certificationUnit = certificationUnit;
    }

    /**
     * 获取照片 :营业执照的扫 照片名称（含路径） 
     *
     * @return business_business_photo - 照片 :营业执照的扫 照片名称（含路径） 
     */
    public String getBusinessBusinessPhoto() {
        return businessBusinessPhoto;
    }

    /**
     * 设置照片 :营业执照的扫 照片名称（含路径） 
     *
     * @param businessBusinessPhoto 照片 :营业执照的扫 照片名称（含路径） 
     */
    public void setBusinessBusinessPhoto(String businessBusinessPhoto) {
        this.businessBusinessPhoto = businessBusinessPhoto;
    }

    /**
     * 获取许可证编号 :道路运输 营许可证编号 
     *
     * @return permit_number - 许可证编号 :道路运输 营许可证编号 
     */
    public String getPermitNumber() {
        return permitNumber;
    }

    /**
     * 设置许可证编号 :道路运输 营许可证编号 
     *
     * @param permitNumber 许可证编号 :道路运输 营许可证编号 
     */
    public void setPermitNumber(String permitNumber) {
        this.permitNumber = permitNumber;
    }

    /**
     * 获取地点/位置 :企业 营地点 
     *
     * @return place_or_location - 地点/位置 :企业 营地点 
     */
    public String getPlaceOrLocation() {
        return placeOrLocation;
    }

    /**
     * 设置地点/位置 :企业 营地点 
     *
     * @param placeOrLocation 地点/位置 :企业 营地点 
     */
    public void setPlaceOrLocation(String placeOrLocation) {
        this.placeOrLocation = placeOrLocation;
    }

    /**
     * 获取营范围 :企业 营范围 
     *
     * @return transport_business_scope - 营范围 :企业 营范围 
     */
    public String getTransportBusinessScope() {
        return transportBusinessScope;
    }

    /**
     * 设置营范围 :企业 营范围 
     *
     * @param transportBusinessScope 营范围 :企业 营范围 
     */
    public void setTransportBusinessScope(String transportBusinessScope) {
        this.transportBusinessScope = transportBusinessScope;
    }

    /**
     * 获取许可证发放日期 :YYYYMMDD 
     *
     * @return permit_grant_date - 许可证发放日期 :YYYYMMDD 
     */
    public String getPermitGrantDate() {
        return permitGrantDate;
    }

    /**
     * 设置许可证发放日期 :YYYYMMDD 
     *
     * @param permitGrantDate 许可证发放日期 :YYYYMMDD 
     */
    public void setPermitGrantDate(String permitGrantDate) {
        this.permitGrantDate = permitGrantDate;
    }

    /**
     * 获取期限开始日期 :道路运输 营许可证有效期开始日期 
     *
     * @return transport_period_start_date - 期限开始日期 :道路运输 营许可证有效期开始日期 
     */
    public String getTransportPeriodStartDate() {
        return transportPeriodStartDate;
    }

    /**
     * 设置期限开始日期 :道路运输 营许可证有效期开始日期 
     *
     * @param transportPeriodStartDate 期限开始日期 :道路运输 营许可证有效期开始日期 
     */
    public void setTransportPeriodStartDate(String transportPeriodStartDate) {
        this.transportPeriodStartDate = transportPeriodStartDate;
    }

    /**
     * 获取期限结束日期 :道路运输 营许可证有效期截止日期 
     *
     * @return transport_period_end_date - 期限结束日期 :道路运输 营许可证有效期截止日期 
     */
    public String getTransportPeriodEndDate() {
        return transportPeriodEndDate;
    }

    /**
     * 设置期限结束日期 :道路运输 营许可证有效期截止日期 
     *
     * @param transportPeriodEndDate 期限结束日期 :道路运输 营许可证有效期截止日期 
     */
    public void setTransportPeriodEndDate(String transportPeriodEndDate) {
        this.transportPeriodEndDate = transportPeriodEndDate;
    }

    /**
     * 获取发证单位 : 
     *
     * @return transport_certification_unit - 发证单位 : 
     */
    public String getTransportCertificationUnit() {
        return transportCertificationUnit;
    }

    /**
     * 设置发证单位 : 
     *
     * @param transportCertificationUnit 发证单位 : 
     */
    public void setTransportCertificationUnit(String transportCertificationUnit) {
        this.transportCertificationUnit = transportCertificationUnit;
    }

    /**
     * 获取照片 :道路运输 营许可证的扫 照片名称（含路径） 
     *
     * @return transport_photo - 照片 :道路运输 营许可证的扫 照片名称（含路径） 
     */
    public String getTransportPhoto() {
        return transportPhoto;
    }

    /**
     * 设置照片 :道路运输 营许可证的扫 照片名称（含路径） 
     *
     * @param transportPhoto 照片 :道路运输 营许可证的扫 照片名称（含路径） 
     */
    public void setTransportPhoto(String transportPhoto) {
        this.transportPhoto = transportPhoto;
    }

    /**
     * 获取自有货运车辆数 :企业自有货运车辆的数
     *
     * @return own_cargo_vehicles_number - 自有货运车辆数 :企业自有货运车辆的数
     */
    public String getOwnCargoVehiclesNumber() {
        return ownCargoVehiclesNumber;
    }

    /**
     * 设置自有货运车辆数 :企业自有货运车辆的数
     *
     * @param ownCargoVehiclesNumber 自有货运车辆数 :企业自有货运车辆的数
     */
    public void setOwnCargoVehiclesNumber(String ownCargoVehiclesNumber) {
        this.ownCargoVehiclesNumber = ownCargoVehiclesNumber;
    }

    /**
     * 获取运力规模 :运输企业的运输能力大小 
     *
     * @return transport_capacity_scale - 运力规模 :运输企业的运输能力大小 
     */
    public String getTransportCapacityScale() {
        return transportCapacityScale;
    }

    /**
     * 设置运力规模 :运输企业的运输能力大小 
     *
     * @param transportCapacityScale 运力规模 :运输企业的运输能力大小 
     */
    public void setTransportCapacityScale(String transportCapacityScale) {
        this.transportCapacityScale = transportCapacityScale;
    }

    /**
     * 获取职工人数 :企业职工的人数 
     *
     * @return workers_number - 职工人数 :企业职工的人数 
     */
    public String getWorkersNumber() {
        return workersNumber;
    }

    /**
     * 设置职工人数 :企业职工的人数 
     *
     * @param workersNumber 职工人数 :企业职工的人数 
     */
    public void setWorkersNumber(String workersNumber) {
        this.workersNumber = workersNumber;
    }

    /**
     * 获取备注 :业务信息的附加说明 
     *
     * @return remark - 备注 :业务信息的附加说明 
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注 :业务信息的附加说明 
     *
     * @param remark 备注 :业务信息的附加说明 
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
}