<%
/**
 * Copyright (c) 2000-2008 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<div class="navigation">
	<liferay-ui:icon-list>
		<liferay-ui:icon
			image="status_online"
			message="sign-in"
			url="<%= themeDisplay.getURLSignIn() %>"
		/>

		<c:if test="<%= OpenIdUtil.isEnabled(company.getCompanyId()) %>">
			<portlet:renderURL var="openIdURL">
				<portlet:param name="struts_action" value="/login/open_id" />
			</portlet:renderURL>

			<liferay-ui:icon
				message="open-id"
				src='<%= themeDisplay.getPathThemeImages() + "/common/openid.gif" %>'
				url="<%= openIdURL %>"
			/>
		</c:if>

		<c:if test="<%= company.isStrangers() %>">
			<liferay-ui:icon
				image="add_user"
				message="create-account"
				url="<%= themeDisplay.getURLCreateAccount().toString() %>"
			/>
		</c:if>

		<c:if test='<%= company.isSendPassword() && GetterUtil.getBoolean(preferences.getValue("emailPasswordSentEnabled",null), true) && PrefsPropsUtil.getBoolean(themeDisplay.getCompanyId(), PropsKeys.ADMIN_EMAIL_PASSWORD_SENT_ENABLED) %>'>
			<portlet:renderURL var="forgotPasswordURL">
				<portlet:param name="struts_action" value="/login/forgot_password" />
			</portlet:renderURL>

			<liferay-ui:icon image="help" message="forgot-password" url="<%= forgotPasswordURL %>" />
		</c:if>
	</liferay-ui:icon-list>
</div>