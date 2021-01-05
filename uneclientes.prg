CLOSE DATABASES all

SET EXCLUSIVE OFF
SET DELETED ON
SET SAFETY OFF 

USE x:\ma05
COPY TO c:\pventa\ma051
USE y:\ma05
COPY TO c:\pventa\ma052

USE z:\ma05
COPY TO c:\pventa\ma053
USE u:\ma05
COPY TO c:\pventa\ma054

USE c:\pventa\ma051
APPEND FROM c:\pventa\ma052
APPEND FROM c:\pventa\ma053
APPEND FROM c:\pventa\ma054

COPY TO c:\pventa\clientes TYPE xls



CLOSE DATABASES all
