﻿using System.Runtime.CompilerServices;
using Tortuga.Anchor.Modeling.Internals;

namespace HemaDrillBook.Pages
{
    public class PageBase<T> : PageBase where T : class
    {
        T? m_Model;
        readonly PropertyBag m_Properties;

        public PageBase()
        {
            m_Properties = new PropertyBag(this);
        }

        protected T? Model
        {
            get => m_Model;
            set
            {
                if (m_Model != value)
                {
                    m_Model = value;
                    OnModelChanged();
                    StateHasChanged();
                }
            }
        }

        protected virtual void OnModelChanged()
        {
        }

        /// <summary>
        /// Sets the specified parameter.
        /// </summary>
        /// <param name="value">The value.</param>
        /// <param name="regenerateModel">If true, set the Model property to null so that it will be regenerated.</param>
        /// <param name="parameterName">Name of the parameter.</param>
        protected void Set(object? value, bool regenerateModel, [CallerMemberName] string parameterName = "")
        {
            if (m_Properties.Set(value!, parameterName) && regenerateModel)
            {
                StateHasChanged();
                if (regenerateModel)
                    Model = null;
            }
        }

        /// <summary>
        /// Gets the specified parameter.
        /// </summary>
        /// <typeparam name="TProperty">The type of parameter to return.</typeparam>
        /// <param name="parameterName">Name of the parameter.</param>
        /// <returns>TProperty.</returns>
        protected TProperty Get<TProperty>([CallerMemberName] string parameterName = "") => m_Properties.Get<TProperty>(parameterName);
    }
}
