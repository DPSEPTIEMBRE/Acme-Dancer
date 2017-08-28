start transaction;

use `Acme-Dancer`;

revoke all privileges on Acme-Dancer`.* from 'acme-user'@'%';
revoke all privileges on Acme-Dancer`.* from 'acme-manager'@'%';

drop user 'acme-user'@'%';
drop user 'acme-manager'@'%';

drop database `Acme-Dancer`;

commit;