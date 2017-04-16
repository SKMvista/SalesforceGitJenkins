global class DataLoaderLeadExportCondition implements TxnSecurity.PolicyCondition {
public boolean evaluate(TxnSecurity.Event e){
	if(Boolean.valueOf(e.data.get('IsApi'))){
		// The event data is a Map<String, String>.
		// We need to call the valueOf() method on appropriate data types to use them in our logic
		Integer numberOfRecords = Integer.valueOf(e.data.get('NumberOfRecords'));
		Integer executionTimeMillis = Integer.valueOf(e.data.get('ExecutionTime'));

		// For API based data export, ClientId is available in the data map.
		String clientId = e.data.get('ClientId');
		String entityName = e.data.get('EntityName');

		if ('Lead'.equals(entityName) &&
			('LexiLoader/'.equals(clientId) || 'DataLoaderPartnerUI/'.equals(clientId)) &&
			numberOfRecords > 2000 && executionTimeMillis > 1000 ){
			return true;
		}
	}
	return false;
}
}