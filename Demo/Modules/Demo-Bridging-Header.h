//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

// C
#include "CModel.h"

// C++
#ifdef __cplusplus
    extern "C" {
#endif
        typedef void* CPPPersonModel;
        CPPPersonModel create(void);
        CPPPersonModel createBy(const char* name, int age, int male);
        void info(CPPPersonModel model);
        const char* getName(CPPPersonModel model);
        void destory(CPPPersonModel model);
#ifdef __cplusplus
    }
#endif

// OC
//#include "Person.h"
