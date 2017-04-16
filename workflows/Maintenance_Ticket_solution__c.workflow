<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Technicians</fullName>
        <description>Email Technicians</description>
        <protected>false</protected>
        <recipients>
            <field>Maintenance_Worker__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Festival_Emails_solution/Maintenance_Notification_solution</template>
    </alerts>
    <rules>
        <fullName>Alert Technician</fullName>
        <actions>
            <name>Email_Technicians</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>IF( ISNULL(Maintenance_Worker__r.Email), False, True)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
