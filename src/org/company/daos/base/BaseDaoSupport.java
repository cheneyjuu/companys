package org.company.daos.base;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.company.beans.base.QueryResult;
import org.company.utils.base.GenericsUtils;

/**
 * DAO层封装使用了泛型，包含常用的CURD和分页操作
 * 
 * @author <a href="http://www.blogjava.net/lishunli/" target="_blank">ShunLi</a>
 * @notes Created on 2010-1-24<br>
 *        Revision of last commit:$Revision: 650 $<br>
 *        Author of last commit:$Author: nhjsjmz@gmail.com $<br>
 *        Date of last commit:$Date: 2010-03-09 20:44:14 +0800 (周二, 09 三月 2010) $<br>
 *        <p>
 */
@SuppressWarnings("unchecked")
public abstract class BaseDaoSupport<T> extends HibernateDaoSupport implements IBaseDao<T>
{
	protected Class<T> entityClass = GenericsUtils.getSuperClassGenricType(this.getClass());
	protected String entityClassName = getEntityName(this.entityClass);
	protected String keyFieldName = getKeyFieldName(this.entityClass);
	
	// 为父类HibernateDaoSupport注入sessionFactory的值
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory)
	{
		super.setSessionFactory(sessionFactory);
	}
	
	/*
	 * @see org.company.daos.DAO#findByEntity(java.lang.Object)
	 */
	public List<T> findByEntity(Object entiey)
	{
		return super.getHibernateTemplate().findByExample(entiey);
	}

	/*
	 * @see org.company.daos.DAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List<T> findByProperty(String propertyName, Object value)
	{
		String queryString = "from " + entityClassName + " o where o." + propertyName + "= ?";
		return super.getHibernateTemplate().find(queryString, value);
	}

	/*
	 * @see org.company.daos.DAO#delete(java.io.Serializable[])
	 */
	public void delete(Serializable... entityids)
	{
		for (Object id : entityids)
		{
			super.getHibernateTemplate().delete(find((Serializable) id));
		}
	}

	/*
	 * @see org.company.daos.DAO#find(java.io.Serializable)
	 */
	public T find(Serializable entityId)
	{
		if (null != entityId)
			return (T) super.getHibernateTemplate().get(entityClass, entityId);
		return null;
	}

	/*
	 * @see org.company.daos.DAO#getCount()
	 */
	public int getCount()
	{
		String hql = "select count( " + keyFieldName + ") from " + entityClassName;
		int count = Integer.parseInt(super.getHibernateTemplate().find(hql).get(0).toString());
		return count;
	}

	public void save(Object entity)
	{
		super.getHibernateTemplate().save(entity);
	}

	/*
	 * @see org.company.daos.DAO#update(java.lang.Object)
	 */
	public void update(Object entity)
	{
		super.getHibernateTemplate().update(entity);
	}

	/*
	 * @see org.company.daos.DAO#getScrollData(int, int, java.lang.String, java.lang.Object[], java.util.LinkedHashMap)
	 */
	public QueryResult<T> getScrollData(final int firstindex, final int maxresult, final String wherejpql, final Object[] queryParams,
			final LinkedHashMap<String, String> orderby)
	{
		final QueryResult<T> queryResult = new QueryResult<T>();

		super.getHibernateTemplate().execute(new HibernateCallback<T>()
		{
			public T doInHibernate(Session session) throws HibernateException, SQLException
			{
				String hql = "from " + entityClassName + " o " + (wherejpql == null || "".equals(wherejpql.trim()) ? "" : " where " + wherejpql)
						+ buildOrderby(orderby);
				Query query = session.createQuery(hql);
				setQueryParams(query, queryParams);// where
				queryResult.setTotalRecord(query.list().size());// first get size

				if (firstindex != -1 && maxresult != -1)
					query.setFirstResult(firstindex).setMaxResults(maxresult);// last page

				queryResult.setResultList(query.list());

				return null;
			}

		});

		return queryResult;

	}

	/*
	 * @see org.company.daos.DAO#getScrollData(int, int, java.lang.String, java.lang.Object[])
	 */
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams)
	{
		return getScrollData(firstindex, maxresult, wherejpql, queryParams, null);
	}

	/*
	 * @see org.company.daos.DAO#getScrollData(int, int, java.util.LinkedHashMap)
	 */
	public QueryResult<T> getScrollData(final int firstindex, final int maxresult, final LinkedHashMap<String, String> orderby)
	{
		return getScrollData(firstindex, maxresult, null, null, orderby);

	}

	/*
	 * @see org.company.daos.DAO#getScrollData(int, int)
	 */
	public QueryResult<T> getScrollData(final int firstindex, final int maxresult)
	{
		return getScrollData(firstindex, maxresult, null, null, null);
	}

	/*
	 * @see org.company.daos.DAO#getScrollData()
	 */
	public QueryResult<T> getScrollData()
	{
		return getScrollData(-1, -1, null, null, null);
	}

	/*
	 * @see org.company.daos.DAO#save(java.lang.Object)
	 */

	/**
	 * 获取实体的名称
	 * 
	 * @param <E>
	 * @param clazz
	 *            实体类
	 * @return
	 */
	protected static <E> String getEntityName(Class<E> clazz)
	{
		String entityname = clazz.getSimpleName();
		Entity entity = clazz.getAnnotation(Entity.class);
		if (entity.name() != null && !"".equals(entity.name()))
		{
			entityname = entity.name();
		}
		return entityname;
	}

	/**
	 * 获取实体的主键
	 * 
	 * @param <E>
	 * @param clazz
	 *            实体类
	 * @return 主键名
	 */
	protected static <E> String getKeyFieldName(Class<E> clazz)
	{
		try
		{
			PropertyDescriptor[] propertyDescriptors = Introspector.getBeanInfo(clazz).getPropertyDescriptors();
			for (PropertyDescriptor propertydesc : propertyDescriptors)
			{
				Method method = propertydesc.getReadMethod();
				if (null != method && null != method.getAnnotation(javax.persistence.Id.class))
				{
					return propertydesc.getName();
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return "id";
	}

	/**
	 * 设置HQL里边的属性值
	 * 
	 * @param query
	 * @param queryParams
	 */
	protected static void setQueryParams(Query query, Object[] queryParams)
	{
		if (queryParams != null && queryParams.length > 0)
		{
			for (int i = 0; i < queryParams.length; i++)
			{
				query.setParameter(i, queryParams[i]);// 从0开始
			}
		}
	}

	/**
	 * 组装order by语句
	 * 
	 * @param orderby
	 * @return
	 */
	protected static String buildOrderby(LinkedHashMap<String, String> orderby)
	{
		StringBuffer orderbyql = new StringBuffer("");
		if (orderby != null && orderby.size() > 0)
		{
			orderbyql.append(" order by ");
			for (String key : orderby.keySet())
			{
				orderbyql.append("o.").append(key).append(" ").append(orderby.get(key)).append(",");
			}
			orderbyql.deleteCharAt(orderbyql.length() - 1);
		}
		return orderbyql.toString();
	}

	protected static <E> String getCountField(Class<E> clazz)
	{
		String out = "o";
		try
		{
			PropertyDescriptor[] propertyDescriptors = Introspector.getBeanInfo(clazz).getPropertyDescriptors();
			for (PropertyDescriptor propertydesc : propertyDescriptors)
			{
				Method method = propertydesc.getReadMethod();
				if (method != null && method.isAnnotationPresent(EmbeddedId.class))
				{
					PropertyDescriptor[] ps = Introspector.getBeanInfo(propertydesc.getPropertyType()).getPropertyDescriptors();
					out = "o." + propertydesc.getName() + "." + (!ps[1].getName().equals("class") ? ps[1].getName() : ps[0].getName());
					break;
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return out;
	}
}
