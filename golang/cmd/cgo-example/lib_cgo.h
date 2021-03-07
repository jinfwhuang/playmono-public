#ifndef LIB_CGO_H_
#define LIB_CGO_H_

#ifdef __cplusplus
// #if defined(__cplusplus) && defined(CGO)
extern "C" {
#endif


int hello();
int add(int i, int j);
void saysomething1(char* s);


#ifdef __cplusplus
// #if defined(__cplusplus) && defined(CGO)
}
#endif

#endif // LIB_CGO_H_