/*
 * @author  Mr.w (魏凯)
 */

 var idcard = function(value, item) {
 	var area = {
 		11: "北京",
 		12: "天津",
 		13: "河北",
 		14: "山西",
 		15: "内蒙古",
 		21: "辽宁",
 		22: "吉林",
 		23: "黑龙江",
 		31: "上海",
 		32: "江苏",
 		33: "浙江",
 		34: "安徽",
 		35: "福建",
 		36: "江西",
 		37: "山东",
 		41: "河南",
 		42: "湖北",
 		43: "湖南",
 		44: "广东",
 		45: "广西",
 		46: "海南",
 		50: "重庆",
 		51: "四川",
 		52: "贵州",
 		53: "云南",
 		54: "西藏",
 		61: "陕西",
 		62: "甘肃",
 		63: "青海",
 		64: "宁夏",
 		65: "新疆",
 		71: "台湾",
 		81: "香港",
 		82: "澳门",
 		91: "国外"
 	}
 	var Y, JYM;
 	var S, M;
 	var idcard_array = new Array();
 	idcard_array = _v.split("");
 	// 地区检验
 	if(area[parseInt(_v.substr(0, 2))] == null) {
 		return "身份证号码地区非法!!,格式例如:32";
 	}
 	// 身份号码位数及格式检验
 	switch(_v.length) {
 		case 15:
 			if((parseInt(_v.substr(6, 2)) + 1900) % 4 == 0 || ((parseInt(_v.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(_v.substr(6, 2)) + 1900) % 4 == 0)) {
 				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/; // 测试出生日期的合法性
 			} else {
 				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/; // 测试出生日期的合法性
 			}
 			if(ereg.test(_v)) {} else {
 				return "身份证号码出生日期超出范围,格式例如:19860817";
 			}
 			break;
 		case 18:
 			// 18位身份号码检测
 			// 出生日期的合法性检查
 			// 闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
 			// 平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
 			if(parseInt(_v.substr(6, 4)) % 4 == 0 || (parseInt(_v.substr(6, 4)) % 100 == 0 && parseInt(_v.substr(6, 4)) % 4 == 0)) {
 				ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/; // 闰年出生日期的合法性正则表达式
 			} else {
 				ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/; // 平年出生日期的合法性正则表达式
 			}
 			if(ereg.test(_v)) { // 测试出生日期的合法性
 				// 计算校验位
 				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) *
 					7 +
 					(parseInt(idcard_array[1]) + parseInt(idcard_array[11])) *
 					9 +
 					(parseInt(idcard_array[2]) + parseInt(idcard_array[12])) *
 					10 +
 					(parseInt(idcard_array[3]) + parseInt(idcard_array[13])) *
 					5 +
 					(parseInt(idcard_array[4]) + parseInt(idcard_array[14])) *
 					8 +
 					(parseInt(idcard_array[5]) + parseInt(idcard_array[15])) *
 					4 +
 					(parseInt(idcard_array[6]) + parseInt(idcard_array[16])) *
 					2 +
 					parseInt(idcard_array[7]) *
 					1 +
 					parseInt(idcard_array[8]) *
 					6 +
 					parseInt(idcard_array[9]) * 3;
 				Y = S % 11;
 				M = "F";
 				JYM = "10X98765432";
 				M = JYM.substr(Y, 1); // 判断校验位
 				// alert(idcard_array[17]);
 				if(M == idcard_array[17]) {
 					// 检测ID的校验位
 				} else {
 					return "身份证号码末位校验位校验出错,请注意x的大小写,格式例如:201X";
 				}
 			} else {
 				return "身份证号码出生日期超出范围,格式例如:19860817";
 			}
 			break;
 		default:
 			return "身份证号码位数不对,应该为15位或是18位";
 			break;
 	}
 }
 
 /**
         * 通过身份证号码得到性别
         *  身份证号码 return 1/2 男/女
*/
var getSexForCard=function (str) {
            var inputStr = str.toString();
            var sex;
            if (inputStr.length == 18) {
                sex = inputStr.charAt(16);
                if (sex % 2 == 0) {
                    return 2;
                } else {
                    return 1;
                }
            } else {
                sex = inputStr.charAt(14);
                if (sex % 2 == 0) {
                    return 2;
                } else {
                    return 1;
                }
            }
    }

var jsGetAge=function (strBirthday) {
            var returnAge;
            var birthYear = strBirthday.slice(0,4);
            var birthMonth = strBirthday.slice(4,6);
            var birthDay = strBirthday.slice(6);

            d = new Date();
            var nowYear = d.getFullYear();
            var nowMonth = d.getMonth() + 1;
            var nowDay = d.getDate();

            if(nowYear == birthYear){
                returnAge = 0;//同年 则为0岁
            }
            else{
                var ageDiff = nowYear - birthYear ; //年之差
                if(ageDiff > 0){
                    if(nowMonth == birthMonth) {
                        var dayDiff = nowDay - birthDay;//日之差
                        if(dayDiff < 0)
                        {
                            returnAge = ageDiff - 1;
                        }
                        else
                        {
                            returnAge = ageDiff ;
                        }
                    }
                    else
                    {
                        var monthDiff = nowMonth - birthMonth;//月之差
                        if(monthDiff < 0)
                        {
                            returnAge = ageDiff - 1;
                        }
                        else
                        {
                            returnAge = ageDiff ;
                        }
                    }
                }
                else
                {
                    returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天
                }
            }

            return returnAge;//返回周岁年龄
    }