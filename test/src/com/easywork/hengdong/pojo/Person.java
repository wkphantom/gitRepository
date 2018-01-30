package com.easywork.hengdong.pojo;

import javax.persistence.*;

public class Person {
    @Id
    private Integer id;

    /**
     * 姓名 :  
     */
    @Column(name = "name_of_person")
    private String nameOfPerson;

    /**
     * 性别 : 
     */
    private String gender;

    /**
     * 身份证号 :  
     */
    @Column(name = "identity_document_number")
    private String identityDocumentNumber;

    /**
     * 移动电话号码 :  
     */
    @Column(name = "mobile_telephone_number")
    private String mobileTelephoneNumber;

    /**
     * 电话号码 :（备用电话号码，可以是移动电话号码） 
     */
    @Column(name = "telephone_number")
    private String telephoneNumber;

    /**
     * 照片 :照片名称（含路径） 
     */
    @Column(name = "identity_photo")
    private String identityPhoto;

    /**
     * 电子邮件地址 : 
     */
    private String email;

    /**
     * 名族: 
     */
    private String nationality;

    /**
     * 出生日期 :YYYYMMDD 
     */
    @Column(name = "birth_date")
    private String birthDate;

    /**
     * 通讯地址 :住址 
     */
    @Column(name = "communication_number")
    private String communicationNumber;

    /**
     * 发证单位 :  
     */
    @Column(name = "identity_certification_unit")
    private String identityCertificationUnit;

    /**
     * 期限开始日期 :  
     */
    @Column(name = "identity_period_start_date")
    private String identityPeriodStartDate;

    /**
     * 期限结束日期 :  
     */
    @Column(name = "identity_period_end_date")
    private String identityPeriodEndDate;

    /**
     * 从业资格证号 :从业资格证的编号 
     */
    @Column(name = "qualification_certificate_number")
    private String qualificationCertificateNumber;

    /**
     * 从业资格类别代码 :从业资格类别代码 
     */
    @Column(name = "qualification_certificate_categorycode")
    private String qualificationCertificateCategorycode;

    /**
     * 发证单位 :发证单位名称 
     */
    @Column(name = "qualification_certificate_certification_unit")
    private String qualificationCertificateCertificationUnit;

    /**
     * 证件初次领取日期 :YYYYMMDD 
     */
    @Column(name = "license_initial_collection_date")
    private String licenseInitialCollectionDate;

    /**
     * 期限开始日期 :  
     */
    @Column(name = "qualification_certificate_period_start_date")
    private String qualificationCertificatePeriodStartDate;

    /**
     * 期限结束日期 :  
     */
    @Column(name = "qualification_certificate_period_end_date")
    private String qualificationCertificatePeriodEndDate;

    /**
     * 照片 :从业资格证扫 照片名称（含路径） 
     */
    @Column(name = "qualification_certificate_photo")
    private String qualificationCertificatePhoto;

    /**
     * 个人证件号 :驾驶证证件号码 
     */
    @Column(name = "personal_identity_document")
    private String personalIdentityDocument;

    /**
     * 国家（地区）名称 : 
     */
    @Column(name = "country_name")
    private String countryName;

    /**
     * 证件初次领取日期 :YYYYMMDD 
     */
    @Column(name = "licenseinitial_collection_date")
    private String licenseinitialCollectionDate;

    /**
     * 准驾车型 :交通运输从业人员允许上路驾驶的车辆类型的名称 
     */
    @Column(name = "vehicle_type_permitted_to_drive")
    private String vehicleTypePermittedToDrive;

    /**
     * 起始时间 :有效起始日期 
     */
    @Column(name = "start_time")
    private String startTime;

    /**
     * 日期/时间/期限 :有效期限 
     */
    @Column(name = "date_or_time_or_period")
    private String dateOrTimeOrPeriod;

    /**
     * 发证单位 :  
     */
    @Column(name = "certification_unit")
    private String certificationUnit;

    /**
     * 照片 :驾驶证扫 照片名称
     */
    @Column(name = "vehicle_type_permitted_photo")
    private String vehicleTypePermittedPhoto;

    /**
     * 企业名称 : 
     */
    @Column(name = "enterprise_name")
    private String enterpriseName;

    /**
     * 地点/位置 : 
     */
    @Column(name = "place_or_location")
    private String placeOrLocation;

    /**
     * 备注 : 
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
     * 获取姓名 :  
     *
     * @return name_of_person - 姓名 :  
     */
    public String getNameOfPerson() {
        return nameOfPerson;
    }

    /**
     * 设置姓名 :  
     *
     * @param nameOfPerson 姓名 :  
     */
    public void setNameOfPerson(String nameOfPerson) {
        this.nameOfPerson = nameOfPerson;
    }

    /**
     * 获取性别 : 
     *
     * @return gender - 性别 : 
     */
    public String getGender() {
        return gender;
    }

    /**
     * 设置性别 : 
     *
     * @param gender 性别 : 
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * 获取身份证号 :  
     *
     * @return identity_document_number - 身份证号 :  
     */
    public String getIdentityDocumentNumber() {
        return identityDocumentNumber;
    }

    /**
     * 设置身份证号 :  
     *
     * @param identityDocumentNumber 身份证号 :  
     */
    public void setIdentityDocumentNumber(String identityDocumentNumber) {
        this.identityDocumentNumber = identityDocumentNumber;
    }

    /**
     * 获取移动电话号码 :  
     *
     * @return mobile_telephone_number - 移动电话号码 :  
     */
    public String getMobileTelephoneNumber() {
        return mobileTelephoneNumber;
    }

    /**
     * 设置移动电话号码 :  
     *
     * @param mobileTelephoneNumber 移动电话号码 :  
     */
    public void setMobileTelephoneNumber(String mobileTelephoneNumber) {
        this.mobileTelephoneNumber = mobileTelephoneNumber;
    }

    /**
     * 获取电话号码 :（备用电话号码，可以是移动电话号码） 
     *
     * @return telephone_number - 电话号码 :（备用电话号码，可以是移动电话号码） 
     */
    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    /**
     * 设置电话号码 :（备用电话号码，可以是移动电话号码） 
     *
     * @param telephoneNumber 电话号码 :（备用电话号码，可以是移动电话号码） 
     */
    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }

    /**
     * 获取照片 :照片名称（含路径） 
     *
     * @return identity_photo - 照片 :照片名称（含路径） 
     */
    public String getIdentityPhoto() {
        return identityPhoto;
    }

    /**
     * 设置照片 :照片名称（含路径） 
     *
     * @param identityPhoto 照片 :照片名称（含路径） 
     */
    public void setIdentityPhoto(String identityPhoto) {
        this.identityPhoto = identityPhoto;
    }

    /**
     * 获取电子邮件地址 : 
     *
     * @return email - 电子邮件地址 : 
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置电子邮件地址 : 
     *
     * @param email 电子邮件地址 : 
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取名族: 
     *
     * @return nationality - 名族: 
     */
    public String getNationality() {
        return nationality;
    }

    /**
     * 设置名族: 
     *
     * @param nationality 名族: 
     */
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    /**
     * 获取出生日期 :YYYYMMDD 
     *
     * @return birth_date - 出生日期 :YYYYMMDD 
     */
    public String getBirthDate() {
        return birthDate;
    }

    /**
     * 设置出生日期 :YYYYMMDD 
     *
     * @param birthDate 出生日期 :YYYYMMDD 
     */
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    /**
     * 获取通讯地址 :住址 
     *
     * @return communication_number - 通讯地址 :住址 
     */
    public String getCommunicationNumber() {
        return communicationNumber;
    }

    /**
     * 设置通讯地址 :住址 
     *
     * @param communicationNumber 通讯地址 :住址 
     */
    public void setCommunicationNumber(String communicationNumber) {
        this.communicationNumber = communicationNumber;
    }

    /**
     * 获取发证单位 :  
     *
     * @return identity_certification_unit - 发证单位 :  
     */
    public String getIdentityCertificationUnit() {
        return identityCertificationUnit;
    }

    /**
     * 设置发证单位 :  
     *
     * @param identityCertificationUnit 发证单位 :  
     */
    public void setIdentityCertificationUnit(String identityCertificationUnit) {
        this.identityCertificationUnit = identityCertificationUnit;
    }

    /**
     * 获取期限开始日期 :  
     *
     * @return identity_period_start_date - 期限开始日期 :  
     */
    public String getIdentityPeriodStartDate() {
        return identityPeriodStartDate;
    }

    /**
     * 设置期限开始日期 :  
     *
     * @param identityPeriodStartDate 期限开始日期 :  
     */
    public void setIdentityPeriodStartDate(String identityPeriodStartDate) {
        this.identityPeriodStartDate = identityPeriodStartDate;
    }

    /**
     * 获取期限结束日期 :  
     *
     * @return identity_period_end_date - 期限结束日期 :  
     */
    public String getIdentityPeriodEndDate() {
        return identityPeriodEndDate;
    }

    /**
     * 设置期限结束日期 :  
     *
     * @param identityPeriodEndDate 期限结束日期 :  
     */
    public void setIdentityPeriodEndDate(String identityPeriodEndDate) {
        this.identityPeriodEndDate = identityPeriodEndDate;
    }

    /**
     * 获取从业资格证号 :从业资格证的编号 
     *
     * @return qualification_certificate_number - 从业资格证号 :从业资格证的编号 
     */
    public String getQualificationCertificateNumber() {
        return qualificationCertificateNumber;
    }

    /**
     * 设置从业资格证号 :从业资格证的编号 
     *
     * @param qualificationCertificateNumber 从业资格证号 :从业资格证的编号 
     */
    public void setQualificationCertificateNumber(String qualificationCertificateNumber) {
        this.qualificationCertificateNumber = qualificationCertificateNumber;
    }

    /**
     * 获取从业资格类别代码 :从业资格类别代码 
     *
     * @return qualification_certificate_categorycode - 从业资格类别代码 :从业资格类别代码 
     */
    public String getQualificationCertificateCategorycode() {
        return qualificationCertificateCategorycode;
    }

    /**
     * 设置从业资格类别代码 :从业资格类别代码 
     *
     * @param qualificationCertificateCategorycode 从业资格类别代码 :从业资格类别代码 
     */
    public void setQualificationCertificateCategorycode(String qualificationCertificateCategorycode) {
        this.qualificationCertificateCategorycode = qualificationCertificateCategorycode;
    }

    /**
     * 获取发证单位 :发证单位名称 
     *
     * @return qualification_certificate_certification_unit - 发证单位 :发证单位名称 
     */
    public String getQualificationCertificateCertificationUnit() {
        return qualificationCertificateCertificationUnit;
    }

    /**
     * 设置发证单位 :发证单位名称 
     *
     * @param qualificationCertificateCertificationUnit 发证单位 :发证单位名称 
     */
    public void setQualificationCertificateCertificationUnit(String qualificationCertificateCertificationUnit) {
        this.qualificationCertificateCertificationUnit = qualificationCertificateCertificationUnit;
    }

    /**
     * 获取证件初次领取日期 :YYYYMMDD 
     *
     * @return license_initial_collection_date - 证件初次领取日期 :YYYYMMDD 
     */
    public String getLicenseInitialCollectionDate() {
        return licenseInitialCollectionDate;
    }

    /**
     * 设置证件初次领取日期 :YYYYMMDD 
     *
     * @param licenseInitialCollectionDate 证件初次领取日期 :YYYYMMDD 
     */
    public void setLicenseInitialCollectionDate(String licenseInitialCollectionDate) {
        this.licenseInitialCollectionDate = licenseInitialCollectionDate;
    }

    /**
     * 获取期限开始日期 :  
     *
     * @return qualification_certificate_period_start_date - 期限开始日期 :  
     */
    public String getQualificationCertificatePeriodStartDate() {
        return qualificationCertificatePeriodStartDate;
    }

    /**
     * 设置期限开始日期 :  
     *
     * @param qualificationCertificatePeriodStartDate 期限开始日期 :  
     */
    public void setQualificationCertificatePeriodStartDate(String qualificationCertificatePeriodStartDate) {
        this.qualificationCertificatePeriodStartDate = qualificationCertificatePeriodStartDate;
    }

    /**
     * 获取期限结束日期 :  
     *
     * @return qualification_certificate_period_end_date - 期限结束日期 :  
     */
    public String getQualificationCertificatePeriodEndDate() {
        return qualificationCertificatePeriodEndDate;
    }

    /**
     * 设置期限结束日期 :  
     *
     * @param qualificationCertificatePeriodEndDate 期限结束日期 :  
     */
    public void setQualificationCertificatePeriodEndDate(String qualificationCertificatePeriodEndDate) {
        this.qualificationCertificatePeriodEndDate = qualificationCertificatePeriodEndDate;
    }

    /**
     * 获取照片 :从业资格证扫 照片名称（含路径） 
     *
     * @return qualification_certificate_photo - 照片 :从业资格证扫 照片名称（含路径） 
     */
    public String getQualificationCertificatePhoto() {
        return qualificationCertificatePhoto;
    }

    /**
     * 设置照片 :从业资格证扫 照片名称（含路径） 
     *
     * @param qualificationCertificatePhoto 照片 :从业资格证扫 照片名称（含路径） 
     */
    public void setQualificationCertificatePhoto(String qualificationCertificatePhoto) {
        this.qualificationCertificatePhoto = qualificationCertificatePhoto;
    }

    /**
     * 获取个人证件号 :驾驶证证件号码 
     *
     * @return personal_identity_document - 个人证件号 :驾驶证证件号码 
     */
    public String getPersonalIdentityDocument() {
        return personalIdentityDocument;
    }

    /**
     * 设置个人证件号 :驾驶证证件号码 
     *
     * @param personalIdentityDocument 个人证件号 :驾驶证证件号码 
     */
    public void setPersonalIdentityDocument(String personalIdentityDocument) {
        this.personalIdentityDocument = personalIdentityDocument;
    }

    /**
     * 获取国家（地区）名称 : 
     *
     * @return country_name - 国家（地区）名称 : 
     */
    public String getCountryName() {
        return countryName;
    }

    /**
     * 设置国家（地区）名称 : 
     *
     * @param countryName 国家（地区）名称 : 
     */
    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    /**
     * 获取证件初次领取日期 :YYYYMMDD 
     *
     * @return licenseinitial_collection_date - 证件初次领取日期 :YYYYMMDD 
     */
    public String getLicenseinitialCollectionDate() {
        return licenseinitialCollectionDate;
    }

    /**
     * 设置证件初次领取日期 :YYYYMMDD 
     *
     * @param licenseinitialCollectionDate 证件初次领取日期 :YYYYMMDD 
     */
    public void setLicenseinitialCollectionDate(String licenseinitialCollectionDate) {
        this.licenseinitialCollectionDate = licenseinitialCollectionDate;
    }

    /**
     * 获取准驾车型 :交通运输从业人员允许上路驾驶的车辆类型的名称 
     *
     * @return vehicle_type_permitted_to_drive - 准驾车型 :交通运输从业人员允许上路驾驶的车辆类型的名称 
     */
    public String getVehicleTypePermittedToDrive() {
        return vehicleTypePermittedToDrive;
    }

    /**
     * 设置准驾车型 :交通运输从业人员允许上路驾驶的车辆类型的名称 
     *
     * @param vehicleTypePermittedToDrive 准驾车型 :交通运输从业人员允许上路驾驶的车辆类型的名称 
     */
    public void setVehicleTypePermittedToDrive(String vehicleTypePermittedToDrive) {
        this.vehicleTypePermittedToDrive = vehicleTypePermittedToDrive;
    }

    /**
     * 获取起始时间 :有效起始日期 
     *
     * @return start_time - 起始时间 :有效起始日期 
     */
    public String getStartTime() {
        return startTime;
    }

    /**
     * 设置起始时间 :有效起始日期 
     *
     * @param startTime 起始时间 :有效起始日期 
     */
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取日期/时间/期限 :有效期限 
     *
     * @return date_or_time_or_period - 日期/时间/期限 :有效期限 
     */
    public String getDateOrTimeOrPeriod() {
        return dateOrTimeOrPeriod;
    }

    /**
     * 设置日期/时间/期限 :有效期限 
     *
     * @param dateOrTimeOrPeriod 日期/时间/期限 :有效期限 
     */
    public void setDateOrTimeOrPeriod(String dateOrTimeOrPeriod) {
        this.dateOrTimeOrPeriod = dateOrTimeOrPeriod;
    }

    /**
     * 获取发证单位 :  
     *
     * @return certification_unit - 发证单位 :  
     */
    public String getCertificationUnit() {
        return certificationUnit;
    }

    /**
     * 设置发证单位 :  
     *
     * @param certificationUnit 发证单位 :  
     */
    public void setCertificationUnit(String certificationUnit) {
        this.certificationUnit = certificationUnit;
    }

    /**
     * 获取照片 :驾驶证扫 照片名称
     *
     * @return vehicle_type_permitted_photo - 照片 :驾驶证扫 照片名称
     */
    public String getVehicleTypePermittedPhoto() {
        return vehicleTypePermittedPhoto;
    }

    /**
     * 设置照片 :驾驶证扫 照片名称
     *
     * @param vehicleTypePermittedPhoto 照片 :驾驶证扫 照片名称
     */
    public void setVehicleTypePermittedPhoto(String vehicleTypePermittedPhoto) {
        this.vehicleTypePermittedPhoto = vehicleTypePermittedPhoto;
    }

    /**
     * 获取企业名称 : 
     *
     * @return enterprise_name - 企业名称 : 
     */
    public String getEnterpriseName() {
        return enterpriseName;
    }

    /**
     * 设置企业名称 : 
     *
     * @param enterpriseName 企业名称 : 
     */
    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    /**
     * 获取地点/位置 : 
     *
     * @return place_or_location - 地点/位置 : 
     */
    public String getPlaceOrLocation() {
        return placeOrLocation;
    }

    /**
     * 设置地点/位置 : 
     *
     * @param placeOrLocation 地点/位置 : 
     */
    public void setPlaceOrLocation(String placeOrLocation) {
        this.placeOrLocation = placeOrLocation;
    }

    /**
     * 获取备注 : 
     *
     * @return remark - 备注 : 
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注 : 
     *
     * @param remark 备注 : 
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
}