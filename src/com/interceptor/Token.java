package com.interceptor;

import java.lang.annotation.*;

/**
 * �Զ���ע��
ElementType.ANNOTATION_TYPE Ӧ��������ע���Ԫע��  
ElementType.CONSTRUCTOR ���캯��  
ElementType.FIELD   �ֶ�  
ElementType.LOCAL_VARIABLE  �����еı��ر���  
ElementType.METHOD  ����  
ElementType.PACKAGE ��  
ElementType.PARAMETER   �����Ĳ���  
ElementType.TYPE    �࣬�ӿڻ���ö������  

RetentionPolicy.SOURCE��
RetentionPolicy.CLASS��
RetentionPolicy.RUNTIME
�ֱ��Ӧ��JavaԴ�ļ�(.java�ļ�)---->.class�ļ�---->�ڴ��е��ֽ���
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Token {
    boolean remove() default false;
}
