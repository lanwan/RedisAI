#ifndef SRC_MODEL_STRUCT_H_
#define SRC_MODEL_STRUCT_H_

#include "config.h"
#include "tensor_struct.h"

typedef struct RAI_Model {
  void* model;
  // TODO: use session pool? The ideal would be to use one session per client.
  //       If a client disconnects, we dispose the session or reuse it for
  //       another client.
  void *session;
  RAI_Backend backend;
  char* devicestr;
  char **inputs;
  size_t ninputs;
  char **outputs;
  size_t noutputs;
  long long refCount;
  long long backend_calls;
  long long backend_us;
  void* data;
} RAI_Model;

typedef struct RAI_ModelCtxParam {
  const char* name;
  RAI_Tensor* tensor;
} RAI_ModelCtxParam;

typedef struct RAI_ModelCtxBatch {
  RAI_ModelCtxParam* inputs;
  RAI_ModelCtxParam* outputs;
} RAI_ModelCtxBatch;

typedef struct RAI_ModelRunCtx {
  size_t ctxtype;
  RAI_Model* model;
  RAI_ModelCtxBatch* batches;
} RAI_ModelRunCtx;

#endif /* SRC_MODEL_STRUCT_H_ */
