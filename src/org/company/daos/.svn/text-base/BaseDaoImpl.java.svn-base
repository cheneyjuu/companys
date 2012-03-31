package org.usc.daos;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import org.hibernate.Query;
import org.usc.beans.QueryResult;
import org.usc.utils.GenericsUtils;

@SuppressWarnings("unchecked")
public abstract class DaoSupport<T> extends MyHibernateDaoSupport implements DAO<T>
{
	protected Class<T> entityClass = GenericsUtils.getSuperClassGenricType(this.getClass());
	protected String entityClassName = getEntityName(this.entityClass);

	/*
	 * @see org.usc.daos.DAO#findByEntity(java.lang.Object)
	 */
	@Override
	public List<T> findByEntity(Object entiey)
	{
		return super.getHibernateTemplate().findByExample(entiey);
	}

	/*
	 * @see org.usc.daos.DAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	public List<T> findByProperty(String propertyName, Object value)
	{
		String queryString = "from " + entityClassName + " o where o." + propertyName + "= ?";
		return super.getHibernateTemplate().find(queryString, value);
	}

	/*
	 * @see org.usc.daos.DAO#delete(java.io.Serializable[])
	 */
	@Override
	public void delete(Serializable... entityids)
	{
		for (Object id : entityids)
		{
			super.getHibernateTemplate().delete(find((Serializable) id));
		}
	}

	/*
	 * @see org.usc.daos.DAO#find(java.io.Serializable)
	 */
	@Override
	public T find(Serializable entityId)
	{
		if (null != entityId)
			return (T) super.getHibernateTemplate().get(entityClass, entityId);
		return null;
	}

	/*
	 * @see org.usc.daos.DAO#getCount()
	 */
	@Override
	public long getCount()
	{
		long count = 0;
		String hql = "select count( " + getKeyFieldName(this.entityClass) + ") from " + entityClassName;
		Query query = getSession().createQuery(hql);
		count = Long.parseLong(query.list().get(0).toString());
		return count;
	}

	@Override
	public void save(Object entity)
	{
		super.getHibernateTemplate().save(entity);
	}

	/*
	 * @see org.usc.daos.DAO#update(java.lang.Object)
	 */
	@Override
	public void update(Object entity)
	{
		super.getHibernateTemplate().update(entity);
	}

	/*
	 * @see org.usc.daos.DAO#getScrollData(int, int, java.lang.String, java.lang.Object[], java.util.LinkedHashMap)
	 */
	@Override
	public QueryResult<T> getScrollData(final int firstindex, final int maxresult, final String wherejpql, final Object[] queryParams,
			final LinkedHashMap<String, String> orderby)
	{
		final QueryResult<T> queryResult = new QueryResult<T>();

		String hql1 = "from " + entityClassName + " o " + (wherejpql == null || "".equals(wherejpql.trim()) ? "" : " where " + wherejpql)
				+ buildOrderby(orderby);
		Query query1 = getSession().createQuery(hql1);
		if (firstindex != -1 && maxresult != -1)
			query1.setFirstResult(firstindex).setMaxResults(maxresult);
		setQueryParams(query1, queryParams);
		queryResult.setResultlist(query1.list());

		String hql2 = "select count( " + getKeyFieldName(this.entityClass) + ") from " + entityClassName + " o "
				+ (wherejpql == null || "".equals(wherejpql.trim()) ? "" : " where " + wherejpql);
		Query query2 = getSession().createQuery(hql2);
		setQueryParams(query2, queryParams);
		queryResult.setTotalrecord(Long.parseLong(query2.list().get(0).toString()));

		return queryResult;

	}

	/*
	 * @see org.usc.daos.DAO#getScrollData(int, int, java.lang.String, java.lang.Object[])
	 */
	@Override
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams)
	{
		return getScrollData(firstindex,maxresult,wherejpql,queryParams,null);
	}

	/*
	 * @see org.usc.daos.DAO#getScrollData(int, int, java.util.LinkedHashMap)
	 */
	@Override
	public QueryResult<T> getScrollData(final int firstindex, final int maxresult, final LinkedHashMap<String, String> orderby)
	{
		return getScrollData(firstindex,maxresult,null,null,orderby);

	}

	/*
	 * @see org.usc.daos.DAO#getScrollData(int, int)
	 */
	@Override
	public QueryResult<T> getScrollData(final int firstindex, final int maxresult)
	{
		return getScrollData(firstindex,maxresult,null,null,null);
	}

	/*
	 * @see org.usc.daos.DAO#getScrollData()
	 */
	@Override
	public QueryResult<T> getScrollData()
	{
		return getScrollData(-1,-1,null,null,null);
	}

	/*
	 * @see org.usc.daos.DAO#save(java.lang.Object)
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
	 * @param query
	 * @param queryParams
	 */
	protected static void setQueryParams(Query query, Object[] queryParams)
	{
		if (queryParams != null && queryParams.length > 0)
		{
			for (int i = 0; i < queryParams.length; i++)
			{
				query.setParameter(i, queryParams[i]);//从0开始
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
