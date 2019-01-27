--List of Farwarder/DeliveryAgent
select agent_code,agent_name from m_deliveryagent order by agent_name

--generic table for multiple type
select * from bcgmast where ittag='F' -- Fault Code Master