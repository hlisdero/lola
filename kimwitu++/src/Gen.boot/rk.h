/* translation of file(s)
	"abs.k"
	"main.k"
	"parse.k"
	"error.k"
	"occur.k"
	"util.k"
	"gen.k"
	"gutil.k"
	"pat.k"
 */
/* generated by:
 *  @(#)$Author: Kimwitu++ version 2.3.11 (C) 1998-2007 Humboldt-University of Berlin $
 */
#ifndef KC_REWRITE_HEADER
#define KC_REWRITE_HEADER

namespace kc { }
using namespace kc;
/* included stuff */
//
// The Termprocessor Kimwitu++
//
// Copyright (C) 1991 University of Twente, Dept TIOS.
// Copyright (C) 1998-2007 Humboldt-Universität zu Berlin, Institute of Informatics
// All rights reserved.
//
// Kimwitu++ is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// Kimwitu++ is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Kimwitu++; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
//

/* end included stuff */


namespace kc {

typedef enum {
    base_rview_enum,
    last_rview
} rview_enum;

struct impl_rviews {
    const char *name;
    rview_class *view;
};
extern struct impl_rviews rviews[];
class rview_class {
protected:
    // only used in derivations
    rview_class(rview_enum v): m_view(v) { }
    rview_class(const rview_class&): m_view(base_rview_enum)
	{ /* do not copy m_view */ }
public:
    const char* name() const
	{ return rviews[m_view].name; }
    operator rview_enum() const
	{ return m_view; }
    bool operator==(const rview_class& other) const
	{ return m_view == other.m_view; }
private:
    rview_enum m_view;
};

/* Use rviews instead
extern char *kc_rview_names[];
*/
struct base_rview_class: rview_class {
    base_rview_class():rview_class(base_rview_enum){}
};
extern base_rview_class base_rview;

} // namespace kc
#endif // KC_REWRITE_HEADER
