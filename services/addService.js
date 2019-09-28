import axios from "axios";
import * as helper from "./serviceHelper"

let getAdds = (pageindex, pageSize) => {

    const config = {
        method: "GET",
        url: `http://localhost:50000/api/companies/paginate?pageIndex=${pageIndex}&pageSize=${pageSize} `,
        // data: payload,
        withCredentials: true,
        crossdomain: true,
        headers: { "Content-Type": "application/json" }
    };

    return axios(config)
        .then(helper.onGlobalSuccess) // this is like the jQuery success : onSuccess
        .catch(helper.onGlobalError); // this is like the jQuery error: onError
};

export default getAdds;