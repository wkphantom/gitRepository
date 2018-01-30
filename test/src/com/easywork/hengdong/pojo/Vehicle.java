package com.easywork.hengdong.pojo;

import javax.persistence.*;

public class Vehicle {
    @Id
    private Integer id;

    /**
     * 车辆牌照号 :  
     */
    @Column(name = "vehicle_number")
    private String vehicleNumber;

    /**
     * 牌照类型代码 :  
     */
    @Column(name = "license_plate_type_code")
    private String licensePlateTypeCode;

    /**
     * 所有人 :车辆所有人（或企业）的名称或姓名 
     */
    private String owner;

    /**
     * 网络访问地址 :详细信息访问地址 
     */
    @Column(name = "network_access_address")
    private String networkAccessAddress;

    /**
     * 车辆分类 :车辆类型 
     */
    @Column(name = "vehicle_classification")
    private String vehicleClassification;

    /**
     * 通讯地址 :车辆所有人的通讯地址 
     */
    @Column(name = "communication_number")
    private String communicationNumber;

    /**
     * 使用性质 :车辆的使用性质
     */
    @Column(name = "use_character")
    private String useCharacter;

    /**
     * 车辆厂牌型号 :品牌型号 
     */
    @Column(name = "vehicle_brand_model")
    private String vehicleBrandModel;

    /**
     * 车辆车架号 :车辆识别VIN码 
     */
    @Column(name = "vehicle_frame_number")
    private String vehicleFrameNumber;

    /**
     * 车辆发动机号 :车辆发动机唯一标识号 
     */
    @Column(name = "vehicle_engine_number")
    private String vehicleEngineNumber;

    /**
     * 注册日期 :车辆行驶证的注册日期 
     */
    @Column(name = "register_date_time")
    private String registerDateTime;

    /**
     * 车辆行驶证签发日期 :车辆行驶证的签发日期 
     */
    @Column(name = "vehicle_licence_issue_date")
    private String vehicleLicenceIssueDate;

    /**
     * 期限开始日期 :有效期始YYYYMMDD 
     */
    @Column(name = "driving_period_start_date")
    private String drivingPeriodStartDate;

    /**
     * 期限结束日期 :有效期止YYYYMMDD 
     */
    @Column(name = "driving_period_end_date")
    private String drivingPeriodEndDate;

    /**
     * 发证单位 :车辆行驶证的签发单位 
     */
    @Column(name = "driving_certification_unit")
    private String drivingCertificationUnit;

    /**
     * 车辆自重 :车辆出厂时额定的车辆自身重 
     */
    @Column(name = "vehicle_tare")
    private String vehicleTare;

    /**
     * 满载车辆质 :核准的车辆及装运的货物的实际总重
     */
    @Column(name = "vehicle_laden_weight")
    private String vehicleLadenWeight;

    /**
     * 车辆载质 :车辆出厂时额定承载的最大载货质 
     */
    @Column(name = "vehicle_tonnage")
    private String vehicleTonnage;

    /**
     * 车辆准牵引总质:车辆牵引车头的质、被牵引车本体的质 、装载货物的质 三者的总和 
     */
    @Column(name = "vehicle_maximum_traction_weight")
    private String vehicleMaximumTractionWeight;

    /**
     * 车辆座位 :驾驶室共乘 
     */
    @Column(name = "vehicle_seats")
    private String vehicleSeats;

    /**
     * 内部尺寸 :车厢的内部尺寸 
     */
    @Column(name = "internal_dimension")
    private String internalDimension;

    /**
     * 车辆长度 :车辆外廓长度 
     */
    @Column(name = "vehicle_length")
    private String vehicleLength;

    /**
     * 车辆宽度 :车辆外廓宽度 
     */
    @Column(name = "vehicle_width")
    private String vehicleWidth;

    /**
     * 车辆高度 :车辆外廓高度 
     */
    @Column(name = "vehicle_height")
    private String vehicleHeight;

    /**
     * 检验记录 :车辆年检记录 
     */
    @Column(name = "inspection_record")
    private String inspectionRecord;

    /**
     * 照片 :照片的名称（含路径） 
     */
    @Column(name = "driving_photo")
    private String drivingPhoto;

    /**
     * 道路运输证号 :浙交运管  字   号 
     */
    @Column(name = "road_transport_certificate_number")
    private String roadTransportCertificateNumber;

    /**
     * 地点/位置 :车辆所有人（企业）的登记地址 
     */
    @Column(name = "place_or_location")
    private String placeOrLocation;

    /**
     * 许可证编号 :营许可证编号 
     */
    @Column(name = "permit_number")
    private String permitNumber;

    /**
     * 营范围 :  
     */
    @Column(name = "business_scope")
    private String businessScope;

    /**
     * 发证日期 :YYYYMMDD 
     */
    @Column(name = "issuing_date")
    private String issuingDate;

    /**
     * 证件初次领取日期 :YYYYMMDD 
     */
    @Column(name = "license_initial_collection_date")
    private String licenseInitialCollectionDate;

    /**
     * 期限开始日期 :有效期始YYYYMMDD 
     */
    @Column(name = "period_start_date")
    private String periodStartDate;

    /**
     * 期限结束日期 :有效期止YYYYMMDD 
     */
    @Column(name = "period_end_date")
    private String periodEndDate;

    /**
     * 发证单位 :发证单位的名称 
     */
    @Column(name = "road_transport_certification_unit")
    private String roadTransportCertificationUnit;

    /**
     * 照片 :照片的名称（含路径） 
     */
    @Column(name = "road_transport_photo")
    private String roadTransportPhoto;

    /**
     * 车辆识别卡号 :车辆的识别卡号 
     */
    @Column(name = "vehicle_identity_card_number")
    private String vehicleIdentityCardNumber;

    /**
     * 车辆识别卡类型代码 :  
     */
    @Column(name = "vehicle_identity_card_type_code")
    private String vehicleIdentityCardTypeCode;

    /**
     * 防伪认证码 :  
     */
    @Column(name = "authenticating_code")
    private String authenticatingCode;

    /**
     * 卡操作方式代码 :  
     */
    @Column(name = "card_operating_code")
    private String cardOperatingCode;

    /**
     * 状态变更日期时间 :YYYYMMDDhhmmss 
     */
    @Column(name = "status_change_date_time")
    private String statusChangeDateTime;

    /**
     * 车辆所属单位名称 :  
     */
    @Column(name = "vehicle_corporation_name")
    private String vehicleCorporationName;

    /**
     * 物流交换代码 :发卡方的物流交换代码 
     */
    @Column(name = "logistics_exchange_code")
    private String logisticsExchangeCode;

    /**
     * 发卡单位 :发卡单位名称 
     */
    @Column(name = "issue_card_enterprise")
    private String issueCardEnterprise;

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
     * 获取车辆牌照号 :  
     *
     * @return vehicle_number - 车辆牌照号 :  
     */
    public String getVehicleNumber() {
        return vehicleNumber;
    }

    /**
     * 设置车辆牌照号 :  
     *
     * @param vehicleNumber 车辆牌照号 :  
     */
    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    /**
     * 获取牌照类型代码 :  
     *
     * @return license_plate_type_code - 牌照类型代码 :  
     */
    public String getLicensePlateTypeCode() {
        return licensePlateTypeCode;
    }

    /**
     * 设置牌照类型代码 :  
     *
     * @param licensePlateTypeCode 牌照类型代码 :  
     */
    public void setLicensePlateTypeCode(String licensePlateTypeCode) {
        this.licensePlateTypeCode = licensePlateTypeCode;
    }

    /**
     * 获取所有人 :车辆所有人（或企业）的名称或姓名 
     *
     * @return owner - 所有人 :车辆所有人（或企业）的名称或姓名 
     */
    public String getOwner() {
        return owner;
    }

    /**
     * 设置所有人 :车辆所有人（或企业）的名称或姓名 
     *
     * @param owner 所有人 :车辆所有人（或企业）的名称或姓名 
     */
    public void setOwner(String owner) {
        this.owner = owner;
    }

    /**
     * 获取网络访问地址 :详细信息访问地址 
     *
     * @return network_access_address - 网络访问地址 :详细信息访问地址 
     */
    public String getNetworkAccessAddress() {
        return networkAccessAddress;
    }

    /**
     * 设置网络访问地址 :详细信息访问地址 
     *
     * @param networkAccessAddress 网络访问地址 :详细信息访问地址 
     */
    public void setNetworkAccessAddress(String networkAccessAddress) {
        this.networkAccessAddress = networkAccessAddress;
    }

    /**
     * 获取车辆分类 :车辆类型 
     *
     * @return vehicle_classification - 车辆分类 :车辆类型 
     */
    public String getVehicleClassification() {
        return vehicleClassification;
    }

    /**
     * 设置车辆分类 :车辆类型 
     *
     * @param vehicleClassification 车辆分类 :车辆类型 
     */
    public void setVehicleClassification(String vehicleClassification) {
        this.vehicleClassification = vehicleClassification;
    }

    /**
     * 获取通讯地址 :车辆所有人的通讯地址 
     *
     * @return communication_number - 通讯地址 :车辆所有人的通讯地址 
     */
    public String getCommunicationNumber() {
        return communicationNumber;
    }

    /**
     * 设置通讯地址 :车辆所有人的通讯地址 
     *
     * @param communicationNumber 通讯地址 :车辆所有人的通讯地址 
     */
    public void setCommunicationNumber(String communicationNumber) {
        this.communicationNumber = communicationNumber;
    }

    /**
     * 获取使用性质 :车辆的使用性质
     *
     * @return use_character - 使用性质 :车辆的使用性质
     */
    public String getUseCharacter() {
        return useCharacter;
    }

    /**
     * 设置使用性质 :车辆的使用性质
     *
     * @param useCharacter 使用性质 :车辆的使用性质
     */
    public void setUseCharacter(String useCharacter) {
        this.useCharacter = useCharacter;
    }

    /**
     * 获取车辆厂牌型号 :品牌型号 
     *
     * @return vehicle_brand_model - 车辆厂牌型号 :品牌型号 
     */
    public String getVehicleBrandModel() {
        return vehicleBrandModel;
    }

    /**
     * 设置车辆厂牌型号 :品牌型号 
     *
     * @param vehicleBrandModel 车辆厂牌型号 :品牌型号 
     */
    public void setVehicleBrandModel(String vehicleBrandModel) {
        this.vehicleBrandModel = vehicleBrandModel;
    }

    /**
     * 获取车辆车架号 :车辆识别VIN码 
     *
     * @return vehicle_frame_number - 车辆车架号 :车辆识别VIN码 
     */
    public String getVehicleFrameNumber() {
        return vehicleFrameNumber;
    }

    /**
     * 设置车辆车架号 :车辆识别VIN码 
     *
     * @param vehicleFrameNumber 车辆车架号 :车辆识别VIN码 
     */
    public void setVehicleFrameNumber(String vehicleFrameNumber) {
        this.vehicleFrameNumber = vehicleFrameNumber;
    }

    /**
     * 获取车辆发动机号 :车辆发动机唯一标识号 
     *
     * @return vehicle_engine_number - 车辆发动机号 :车辆发动机唯一标识号 
     */
    public String getVehicleEngineNumber() {
        return vehicleEngineNumber;
    }

    /**
     * 设置车辆发动机号 :车辆发动机唯一标识号 
     *
     * @param vehicleEngineNumber 车辆发动机号 :车辆发动机唯一标识号 
     */
    public void setVehicleEngineNumber(String vehicleEngineNumber) {
        this.vehicleEngineNumber = vehicleEngineNumber;
    }

    /**
     * 获取注册日期 :车辆行驶证的注册日期 
     *
     * @return register_date_time - 注册日期 :车辆行驶证的注册日期 
     */
    public String getRegisterDateTime() {
        return registerDateTime;
    }

    /**
     * 设置注册日期 :车辆行驶证的注册日期 
     *
     * @param registerDateTime 注册日期 :车辆行驶证的注册日期 
     */
    public void setRegisterDateTime(String registerDateTime) {
        this.registerDateTime = registerDateTime;
    }

    /**
     * 获取车辆行驶证签发日期 :车辆行驶证的签发日期 
     *
     * @return vehicle_licence_issue_date - 车辆行驶证签发日期 :车辆行驶证的签发日期 
     */
    public String getVehicleLicenceIssueDate() {
        return vehicleLicenceIssueDate;
    }

    /**
     * 设置车辆行驶证签发日期 :车辆行驶证的签发日期 
     *
     * @param vehicleLicenceIssueDate 车辆行驶证签发日期 :车辆行驶证的签发日期 
     */
    public void setVehicleLicenceIssueDate(String vehicleLicenceIssueDate) {
        this.vehicleLicenceIssueDate = vehicleLicenceIssueDate;
    }

    /**
     * 获取期限开始日期 :有效期始YYYYMMDD 
     *
     * @return driving_period_start_date - 期限开始日期 :有效期始YYYYMMDD 
     */
    public String getDrivingPeriodStartDate() {
        return drivingPeriodStartDate;
    }

    /**
     * 设置期限开始日期 :有效期始YYYYMMDD 
     *
     * @param drivingPeriodStartDate 期限开始日期 :有效期始YYYYMMDD 
     */
    public void setDrivingPeriodStartDate(String drivingPeriodStartDate) {
        this.drivingPeriodStartDate = drivingPeriodStartDate;
    }

    /**
     * 获取期限结束日期 :有效期止YYYYMMDD 
     *
     * @return driving_period_end_date - 期限结束日期 :有效期止YYYYMMDD 
     */
    public String getDrivingPeriodEndDate() {
        return drivingPeriodEndDate;
    }

    /**
     * 设置期限结束日期 :有效期止YYYYMMDD 
     *
     * @param drivingPeriodEndDate 期限结束日期 :有效期止YYYYMMDD 
     */
    public void setDrivingPeriodEndDate(String drivingPeriodEndDate) {
        this.drivingPeriodEndDate = drivingPeriodEndDate;
    }

    /**
     * 获取发证单位 :车辆行驶证的签发单位 
     *
     * @return driving_certification_unit - 发证单位 :车辆行驶证的签发单位 
     */
    public String getDrivingCertificationUnit() {
        return drivingCertificationUnit;
    }

    /**
     * 设置发证单位 :车辆行驶证的签发单位 
     *
     * @param drivingCertificationUnit 发证单位 :车辆行驶证的签发单位 
     */
    public void setDrivingCertificationUnit(String drivingCertificationUnit) {
        this.drivingCertificationUnit = drivingCertificationUnit;
    }

    /**
     * 获取车辆自重 :车辆出厂时额定的车辆自身重 
     *
     * @return vehicle_tare - 车辆自重 :车辆出厂时额定的车辆自身重 
     */
    public String getVehicleTare() {
        return vehicleTare;
    }

    /**
     * 设置车辆自重 :车辆出厂时额定的车辆自身重 
     *
     * @param vehicleTare 车辆自重 :车辆出厂时额定的车辆自身重 
     */
    public void setVehicleTare(String vehicleTare) {
        this.vehicleTare = vehicleTare;
    }

    /**
     * 获取满载车辆质 :核准的车辆及装运的货物的实际总重
     *
     * @return vehicle_laden_weight - 满载车辆质 :核准的车辆及装运的货物的实际总重
     */
    public String getVehicleLadenWeight() {
        return vehicleLadenWeight;
    }

    /**
     * 设置满载车辆质 :核准的车辆及装运的货物的实际总重
     *
     * @param vehicleLadenWeight 满载车辆质 :核准的车辆及装运的货物的实际总重
     */
    public void setVehicleLadenWeight(String vehicleLadenWeight) {
        this.vehicleLadenWeight = vehicleLadenWeight;
    }

    /**
     * 获取车辆载质 :车辆出厂时额定承载的最大载货质 
     *
     * @return vehicle_tonnage - 车辆载质 :车辆出厂时额定承载的最大载货质 
     */
    public String getVehicleTonnage() {
        return vehicleTonnage;
    }

    /**
     * 设置车辆载质 :车辆出厂时额定承载的最大载货质 
     *
     * @param vehicleTonnage 车辆载质 :车辆出厂时额定承载的最大载货质 
     */
    public void setVehicleTonnage(String vehicleTonnage) {
        this.vehicleTonnage = vehicleTonnage;
    }

    /**
     * 获取车辆准牵引总质:车辆牵引车头的质、被牵引车本体的质 、装载货物的质 三者的总和 
     *
     * @return vehicle_maximum_traction_weight - 车辆准牵引总质:车辆牵引车头的质、被牵引车本体的质 、装载货物的质 三者的总和 
     */
    public String getVehicleMaximumTractionWeight() {
        return vehicleMaximumTractionWeight;
    }

    /**
     * 设置车辆准牵引总质:车辆牵引车头的质、被牵引车本体的质 、装载货物的质 三者的总和 
     *
     * @param vehicleMaximumTractionWeight 车辆准牵引总质:车辆牵引车头的质、被牵引车本体的质 、装载货物的质 三者的总和 
     */
    public void setVehicleMaximumTractionWeight(String vehicleMaximumTractionWeight) {
        this.vehicleMaximumTractionWeight = vehicleMaximumTractionWeight;
    }

    /**
     * 获取车辆座位 :驾驶室共乘 
     *
     * @return vehicle_seats - 车辆座位 :驾驶室共乘 
     */
    public String getVehicleSeats() {
        return vehicleSeats;
    }

    /**
     * 设置车辆座位 :驾驶室共乘 
     *
     * @param vehicleSeats 车辆座位 :驾驶室共乘 
     */
    public void setVehicleSeats(String vehicleSeats) {
        this.vehicleSeats = vehicleSeats;
    }

    /**
     * 获取内部尺寸 :车厢的内部尺寸 
     *
     * @return internal_dimension - 内部尺寸 :车厢的内部尺寸 
     */
    public String getInternalDimension() {
        return internalDimension;
    }

    /**
     * 设置内部尺寸 :车厢的内部尺寸 
     *
     * @param internalDimension 内部尺寸 :车厢的内部尺寸 
     */
    public void setInternalDimension(String internalDimension) {
        this.internalDimension = internalDimension;
    }

    /**
     * 获取车辆长度 :车辆外廓长度 
     *
     * @return vehicle_length - 车辆长度 :车辆外廓长度 
     */
    public String getVehicleLength() {
        return vehicleLength;
    }

    /**
     * 设置车辆长度 :车辆外廓长度 
     *
     * @param vehicleLength 车辆长度 :车辆外廓长度 
     */
    public void setVehicleLength(String vehicleLength) {
        this.vehicleLength = vehicleLength;
    }

    /**
     * 获取车辆宽度 :车辆外廓宽度 
     *
     * @return vehicle_width - 车辆宽度 :车辆外廓宽度 
     */
    public String getVehicleWidth() {
        return vehicleWidth;
    }

    /**
     * 设置车辆宽度 :车辆外廓宽度 
     *
     * @param vehicleWidth 车辆宽度 :车辆外廓宽度 
     */
    public void setVehicleWidth(String vehicleWidth) {
        this.vehicleWidth = vehicleWidth;
    }

    /**
     * 获取车辆高度 :车辆外廓高度 
     *
     * @return vehicle_height - 车辆高度 :车辆外廓高度 
     */
    public String getVehicleHeight() {
        return vehicleHeight;
    }

    /**
     * 设置车辆高度 :车辆外廓高度 
     *
     * @param vehicleHeight 车辆高度 :车辆外廓高度 
     */
    public void setVehicleHeight(String vehicleHeight) {
        this.vehicleHeight = vehicleHeight;
    }

    /**
     * 获取检验记录 :车辆年检记录 
     *
     * @return inspection_record - 检验记录 :车辆年检记录 
     */
    public String getInspectionRecord() {
        return inspectionRecord;
    }

    /**
     * 设置检验记录 :车辆年检记录 
     *
     * @param inspectionRecord 检验记录 :车辆年检记录 
     */
    public void setInspectionRecord(String inspectionRecord) {
        this.inspectionRecord = inspectionRecord;
    }

    /**
     * 获取照片 :照片的名称（含路径） 
     *
     * @return driving_photo - 照片 :照片的名称（含路径） 
     */
    public String getDrivingPhoto() {
        return drivingPhoto;
    }

    /**
     * 设置照片 :照片的名称（含路径） 
     *
     * @param drivingPhoto 照片 :照片的名称（含路径） 
     */
    public void setDrivingPhoto(String drivingPhoto) {
        this.drivingPhoto = drivingPhoto;
    }

    /**
     * 获取道路运输证号 :浙交运管  字   号 
     *
     * @return road_transport_certificate_number - 道路运输证号 :浙交运管  字   号 
     */
    public String getRoadTransportCertificateNumber() {
        return roadTransportCertificateNumber;
    }

    /**
     * 设置道路运输证号 :浙交运管  字   号 
     *
     * @param roadTransportCertificateNumber 道路运输证号 :浙交运管  字   号 
     */
    public void setRoadTransportCertificateNumber(String roadTransportCertificateNumber) {
        this.roadTransportCertificateNumber = roadTransportCertificateNumber;
    }

    /**
     * 获取地点/位置 :车辆所有人（企业）的登记地址 
     *
     * @return place_or_location - 地点/位置 :车辆所有人（企业）的登记地址 
     */
    public String getPlaceOrLocation() {
        return placeOrLocation;
    }

    /**
     * 设置地点/位置 :车辆所有人（企业）的登记地址 
     *
     * @param placeOrLocation 地点/位置 :车辆所有人（企业）的登记地址 
     */
    public void setPlaceOrLocation(String placeOrLocation) {
        this.placeOrLocation = placeOrLocation;
    }

    /**
     * 获取许可证编号 :营许可证编号 
     *
     * @return permit_number - 许可证编号 :营许可证编号 
     */
    public String getPermitNumber() {
        return permitNumber;
    }

    /**
     * 设置许可证编号 :营许可证编号 
     *
     * @param permitNumber 许可证编号 :营许可证编号 
     */
    public void setPermitNumber(String permitNumber) {
        this.permitNumber = permitNumber;
    }

    /**
     * 获取营范围 :  
     *
     * @return business_scope - 营范围 :  
     */
    public String getBusinessScope() {
        return businessScope;
    }

    /**
     * 设置营范围 :  
     *
     * @param businessScope 营范围 :  
     */
    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope;
    }

    /**
     * 获取发证日期 :YYYYMMDD 
     *
     * @return issuing_date - 发证日期 :YYYYMMDD 
     */
    public String getIssuingDate() {
        return issuingDate;
    }

    /**
     * 设置发证日期 :YYYYMMDD 
     *
     * @param issuingDate 发证日期 :YYYYMMDD 
     */
    public void setIssuingDate(String issuingDate) {
        this.issuingDate = issuingDate;
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
     * 获取期限开始日期 :有效期始YYYYMMDD 
     *
     * @return period_start_date - 期限开始日期 :有效期始YYYYMMDD 
     */
    public String getPeriodStartDate() {
        return periodStartDate;
    }

    /**
     * 设置期限开始日期 :有效期始YYYYMMDD 
     *
     * @param periodStartDate 期限开始日期 :有效期始YYYYMMDD 
     */
    public void setPeriodStartDate(String periodStartDate) {
        this.periodStartDate = periodStartDate;
    }

    /**
     * 获取期限结束日期 :有效期止YYYYMMDD 
     *
     * @return period_end_date - 期限结束日期 :有效期止YYYYMMDD 
     */
    public String getPeriodEndDate() {
        return periodEndDate;
    }

    /**
     * 设置期限结束日期 :有效期止YYYYMMDD 
     *
     * @param periodEndDate 期限结束日期 :有效期止YYYYMMDD 
     */
    public void setPeriodEndDate(String periodEndDate) {
        this.periodEndDate = periodEndDate;
    }

    /**
     * 获取发证单位 :发证单位的名称 
     *
     * @return road_transport_certification_unit - 发证单位 :发证单位的名称 
     */
    public String getRoadTransportCertificationUnit() {
        return roadTransportCertificationUnit;
    }

    /**
     * 设置发证单位 :发证单位的名称 
     *
     * @param roadTransportCertificationUnit 发证单位 :发证单位的名称 
     */
    public void setRoadTransportCertificationUnit(String roadTransportCertificationUnit) {
        this.roadTransportCertificationUnit = roadTransportCertificationUnit;
    }

    /**
     * 获取照片 :照片的名称（含路径） 
     *
     * @return road_transport_photo - 照片 :照片的名称（含路径） 
     */
    public String getRoadTransportPhoto() {
        return roadTransportPhoto;
    }

    /**
     * 设置照片 :照片的名称（含路径） 
     *
     * @param roadTransportPhoto 照片 :照片的名称（含路径） 
     */
    public void setRoadTransportPhoto(String roadTransportPhoto) {
        this.roadTransportPhoto = roadTransportPhoto;
    }

    /**
     * 获取车辆识别卡号 :车辆的识别卡号 
     *
     * @return vehicle_identity_card_number - 车辆识别卡号 :车辆的识别卡号 
     */
    public String getVehicleIdentityCardNumber() {
        return vehicleIdentityCardNumber;
    }

    /**
     * 设置车辆识别卡号 :车辆的识别卡号 
     *
     * @param vehicleIdentityCardNumber 车辆识别卡号 :车辆的识别卡号 
     */
    public void setVehicleIdentityCardNumber(String vehicleIdentityCardNumber) {
        this.vehicleIdentityCardNumber = vehicleIdentityCardNumber;
    }

    /**
     * 获取车辆识别卡类型代码 :  
     *
     * @return vehicle_identity_card_type_code - 车辆识别卡类型代码 :  
     */
    public String getVehicleIdentityCardTypeCode() {
        return vehicleIdentityCardTypeCode;
    }

    /**
     * 设置车辆识别卡类型代码 :  
     *
     * @param vehicleIdentityCardTypeCode 车辆识别卡类型代码 :  
     */
    public void setVehicleIdentityCardTypeCode(String vehicleIdentityCardTypeCode) {
        this.vehicleIdentityCardTypeCode = vehicleIdentityCardTypeCode;
    }

    /**
     * 获取防伪认证码 :  
     *
     * @return authenticating_code - 防伪认证码 :  
     */
    public String getAuthenticatingCode() {
        return authenticatingCode;
    }

    /**
     * 设置防伪认证码 :  
     *
     * @param authenticatingCode 防伪认证码 :  
     */
    public void setAuthenticatingCode(String authenticatingCode) {
        this.authenticatingCode = authenticatingCode;
    }

    /**
     * 获取卡操作方式代码 :  
     *
     * @return card_operating_code - 卡操作方式代码 :  
     */
    public String getCardOperatingCode() {
        return cardOperatingCode;
    }

    /**
     * 设置卡操作方式代码 :  
     *
     * @param cardOperatingCode 卡操作方式代码 :  
     */
    public void setCardOperatingCode(String cardOperatingCode) {
        this.cardOperatingCode = cardOperatingCode;
    }

    /**
     * 获取状态变更日期时间 :YYYYMMDDhhmmss 
     *
     * @return status_change_date_time - 状态变更日期时间 :YYYYMMDDhhmmss 
     */
    public String getStatusChangeDateTime() {
        return statusChangeDateTime;
    }

    /**
     * 设置状态变更日期时间 :YYYYMMDDhhmmss 
     *
     * @param statusChangeDateTime 状态变更日期时间 :YYYYMMDDhhmmss 
     */
    public void setStatusChangeDateTime(String statusChangeDateTime) {
        this.statusChangeDateTime = statusChangeDateTime;
    }

    /**
     * 获取车辆所属单位名称 :  
     *
     * @return vehicle_corporation_name - 车辆所属单位名称 :  
     */
    public String getVehicleCorporationName() {
        return vehicleCorporationName;
    }

    /**
     * 设置车辆所属单位名称 :  
     *
     * @param vehicleCorporationName 车辆所属单位名称 :  
     */
    public void setVehicleCorporationName(String vehicleCorporationName) {
        this.vehicleCorporationName = vehicleCorporationName;
    }

    /**
     * 获取物流交换代码 :发卡方的物流交换代码 
     *
     * @return logistics_exchange_code - 物流交换代码 :发卡方的物流交换代码 
     */
    public String getLogisticsExchangeCode() {
        return logisticsExchangeCode;
    }

    /**
     * 设置物流交换代码 :发卡方的物流交换代码 
     *
     * @param logisticsExchangeCode 物流交换代码 :发卡方的物流交换代码 
     */
    public void setLogisticsExchangeCode(String logisticsExchangeCode) {
        this.logisticsExchangeCode = logisticsExchangeCode;
    }

    /**
     * 获取发卡单位 :发卡单位名称 
     *
     * @return issue_card_enterprise - 发卡单位 :发卡单位名称 
     */
    public String getIssueCardEnterprise() {
        return issueCardEnterprise;
    }

    /**
     * 设置发卡单位 :发卡单位名称 
     *
     * @param issueCardEnterprise 发卡单位 :发卡单位名称 
     */
    public void setIssueCardEnterprise(String issueCardEnterprise) {
        this.issueCardEnterprise = issueCardEnterprise;
    }
}