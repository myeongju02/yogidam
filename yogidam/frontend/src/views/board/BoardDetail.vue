<template>
  <div id="webcrumbs" v-if="post">
    <div class="w-[1024px] mx-auto p-6 font-sans bg-gray-50 rounded-lg shadow-md">
      <div class="flex flex-col md:flex-row justify-between items-start gap-6">
        <!-- 본문 -->
        <div class="w-full md:w-3/4">
          <div class="mb-6">
            <div class="flex justify-between items-center mb-2">
              <div class="flex items-center gap-2">
                <span class="px-3 py-1 text-xs font-semibold bg-primary-100 text-primary-700 rounded-full">
                  {{ post.category || '커뮤니티' }}
                </span>
                <span class="text-sm text-gray-500">{{ formatDate(post.createdAt) }}</span>
              </div>
              <div class="flex items-center gap-2">
                <!-- 북마크/공유 버튼 (디자인만) -->
                <button
                  class="flex items-center justify-center rounded-full w-8 h-8 hover:bg-gray-100 transition-colors duration-200">
                  <span class="material-symbols-outlined text-gray-600">bookmark_border</span>
                </button>
                <button
                  class="flex items-center justify-center rounded-full w-8 h-8 hover:bg-gray-100 transition-colors duration-200">
                  <span class="material-symbols-outlined text-gray-600">share</span>
                </button>
                <!-- 작성자만 수정/삭제 -->
                <template v-if="post && post.author === currentUser">
                  <button class="px-3 py-1 rounded bg-primary-500 text-white text-xs hover:bg-primary-700 ml-2"
                    @click="editPost">수정</button>
                  <button class="px-3 py-1 rounded bg-red-500 text-white text-xs hover:bg-red-700"
                    @click="deletePost">삭제</button>
                </template>
              </div>
            </div>
            <div class="flex justify-between items-center mb-2">
              <h1 class="text-2xl md:text-3xl font-bold mb-3">
                {{ post.title }}
              </h1>
              <div class="flex items-center gap-3">
                <div class="flex items-center gap-2">
                  <img :src="authorProfileImg" alt="Profile" class="w-10 h-10 rounded-full object-cover"
                    keywords="profile, user, avatar" />
                  <div>
                    <p class="font-medium">{{ post.author }}</p>
                    <p class="text-xs text-gray-500">여행 블로거</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="mb-8">
            <div v-if="post.images && post.images.length" class="flex flex-wrap gap-2 mb-6">
              <img v-for="img in post.images" :key="img.id || img.url" :src="img.url" :alt="img.name || '게시글 이미지'"
                class="w-40 h-40 object-cover rounded-lg" />
            </div>
            <div class="prose max-w-none" v-html="post.content" style="white-space: pre-line"></div>
            <div v-if="post.files && post.files.length" class="mt-4">
              <h4 class="font-bold mb-2">첨부파일</h4>
              <ul>
                <li v-for="file in post.files" :key="file.id || file.url">
                  <a :href="file.url" :download="file.name || undefined" target="_blank" rel="noopener"
                    class="text-primary-600 underline">
                    {{ (file.name || extractFileName(file.url)).length > 30
                      ? (file.name || extractFileName(file.url)).slice(0, 15) + '...' + (file.name ||
                        extractFileName(file.url)).slice(-10)
                      : (file.name || extractFileName(file.url))
                    }}
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <!-- 하단(좋아요/댓글 등) -->
          <div class="flex items-center justify-between mt-10 pt-6 border-t border-gray-200">
            <div class="flex gap-4">
              <button
                class="flex items-center gap-1 px-4 py-2 rounded-full bg-gray-100 hover:bg-gray-200 transition-colors duration-200">
                <span class="material-symbols-outlined">thumb_up</span>
                <span>좋아요 {{ post.likes || 0 }}</span>
              </button>
              <button
                class="flex items-center gap-1 px-4 py-2 rounded-full bg-gray-100 hover:bg-gray-200 transition-colors duration-200">
                <span class="material-symbols-outlined">chat_bubble_outline</span>
                <span>댓글 {{ post.comments?.length || 0 }}</span>
              </button>
            </div>
            <div class="flex gap-2">
              <button
                class="flex items-center justify-center rounded-full w-10 h-10 bg-gray-100 hover:bg-gray-200 transition-colors duration-200">
                <span class="material-symbols-outlined">content_copy</span>
              </button>
              <button
                class="flex items-center justify-center rounded-full w-10 h-10 bg-gray-100 hover:bg-gray-200 transition-colors duration-200">
                <span class="material-symbols-outlined">report</span>
              </button>
            </div>
          </div>
          <!-- 댓글 영역 -->
          <div class="mb-10 mt-8">
            <h3 class="text-xl font-bold mb-4">댓글 {{ comments.length }}</h3>
            <!-- 댓글 입력 -->
            <div class="flex gap-3 mb-6 items-center">
              <img :src="currentProfileImg" alt="User" class="w-10 h-10 rounded-full object-cover" />
              <div class="flex-1 relative">
                <input type="text" v-model="comment" placeholder="댓글을 입력하세요..."
                  class="w-full px-4 py-3 pr-12 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  @keyup.enter="submitComment" />
                <button @click="submitComment"
                  class="absolute top-1/2 right-3 -translate-y-1/2 text-primary-500 hover:text-primary-600 disabled:text-gray-300"
                  :disabled="!comment.trim()" title="댓글 올리기" type="button">
                  <img src="@/assets/sendmessage.png" class="w-6 h-6" alt="댓글 보내기" />
                </button>
              </div>
            </div>
            <!-- 댓글 리스트 -->
            <div class="space-y-6">
              <div v-for="comment in comments" :key="comment.id" class="flex gap-3">
                <img :src="comment.profileImg || DEFAULT_PROFILE_IMG" alt="User"
                  class="w-10 h-10 rounded-full object-cover" />
                <div class="flex-1">
                  <div class="bg-white p-4 rounded-lg shadow-sm">
                    <div class="flex justify-between items-center mb-2">
                      <h4 class="font-medium">{{ comment.author }}</h4>
                      <span class="text-xs text-gray-500">{{ comment.date }}</span>
                    </div>
                    <!-- 인라인 수정 모드 -->
                    <div v-if="editingCommentId === comment.id">
                      <textarea v-model="editContent" class="w-full border border-gray-300 rounded mb-2 p-2" rows="2" />
                      <div class="flex gap-2">
                        <button class="px-3 py-1 bg-primary-500 text-white rounded hover:bg-primary-700 text-xs"
                          @click="updateComment(comment.id)">저장</button>
                        <button class="px-3 py-1 bg-gray-300 text-gray-700 rounded hover:bg-gray-400 text-xs"
                          @click="cancelEdit">취소</button>
                      </div>
                    </div>
                    <!-- 일반 모드 -->
                    <div v-else>
                      <p class="text-gray-800">{{ comment.content }}</p>
                      <div class="flex items-center gap-4 mt-3 text-sm text-gray-500">
                        <button class="flex items-center gap-1 hover:text-gray-700 transition-colors duration-200">
                          <span class="material-symbols-outlined text-sm">thumb_up</span>
                          <span>{{ comment.likes || 0 }}</span>
                        </button>
                        <button class="hover:text-gray-700 transition-colors duration-200">
                          답글
                        </button>
                        <!-- 본인 댓글에만 수정/삭제 노출 -->
                        <template v-if="comment.author === currentUser">
                          <button
                            class="ml-2 px-2 py-1 text-xs bg-primary-100 text-primary-700 rounded hover:bg-primary-200"
                            @click="startEdit(comment)">수정</button>
                          <button class="ml-1 px-2 py-1 text-xs bg-red-100 text-red-700 rounded hover:bg-red-200"
                            @click="deleteComment(comment.id)">삭제</button>
                        </template>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 사이드바 -->
        <aside class="w-full md:w-1/4 sticky top-6">
          <div class="bg-white p-5 rounded-lg shadow-sm mb-6">
            <h3 class="text-lg font-bold mb-4">인기 게시글</h3>
            <!-- 인기 게시글 예시 (실제 데이터로 교체 가능) -->
            <div class="space-y-4">
              <a href="#" class="flex gap-3 group">
                <img src="https://images.unsplash.com/photo-1556742400-b5b7c5121f99?..." alt="Thumbnail"
                  class="w-20 h-16 object-cover rounded-md" />
                <div class="flex-1">
                  <h4 class="text-sm font-medium group-hover:text-primary-600 transition-colors duration-200">
                    제주도 숨은 카페 명소 BEST 5
                  </h4>
                  <p class="text-xs text-gray-500 mt-1">조회 1,245</p>
                </div>
              </a>
              <!-- ...다른 인기 게시글 생략... -->
            </div>
          </div>
          <div class="bg-white p-5 rounded-lg shadow-sm mb-6">
            <h3 class="text-lg font-bold mb-4">작성자 정보</h3>
            <div class="flex items-center gap-3 mb-4">
              <img :src="authorProfileImg || []" alt="Profile" class="w-10 h-10 rounded-full object-cover"
                keywords="profile, user, avatar" />
              <div>
                <p class="font-medium">{{ post.author }}</p>
                <p class="text-xs text-gray-500">팔로워 1,250</p>
              </div>
            </div>
            <p class="text-sm text-gray-600 mb-4">
              국내외 여행 정보를 공유하는 여행 블로거입니다. 맛집, 카페, 숙소 리뷰도 함께 올립니다.
            </p>
            <button
              class="w-full py-2 bg-primary-500 text-white rounded-md hover:bg-primary-600 transition-colors duration-200">
              프로필 방문하기
            </button>
          </div>

        </aside>
      </div>
    </div>
  </div>
  <div v-else class="text-center py-20 text-gray-400">게시글을 불러오는 중입니다...</div>
</template>


<script setup>
import { ref, onMounted, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
import { useUserStore } from '@/stores/user';

const DEFAULT_PROFILE_IMG = "https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/defaultprofileImg.png";
const post = ref(null);
const loading = ref(false);
const error = ref(null);
const route = useRoute();
const router = useRouter();
const comments = ref([]);         // 댓글 목록 상태
const comment = ref('');           // 입력 중인 댓글
const editingCommentId = ref(null);    // 현재 수정 중인 댓글 id
const editContent = ref('');           // 수정 중인 댓글 내용

// 사용자 관리
const userStore = useUserStore();
const user = computed(() => userStore.user);
const currentUser = userStore.user?.id || 'guest';
const profileImg = ref('');
const currentUserProfile = computed(() => user.value?.profile?.img || DEFAULT_PROFILE_IMG);
const authorProfileImg = ref(DEFAULT_PROFILE_IMG);

async function fetchProfile(authorId) {
  try {
    const res = await axios.get('/api/member/profile', { params: { userId: authorId } });
    return res.data || DEFAULT_PROFILE_IMG;
  } catch (e) {
    return DEFAULT_PROFILE_IMG;
  }
}
const currentProfileImg = computed(() => {
  const profile = user.value?.profile;
  if (profile && profile.trim() !== "") return profile;
  return "https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/defaultprofileImg.png";
});

async function fetchComments() {
  try {
    const res = await axios.get(`/api/boards/${route.params.id}/comments`);
    comments.value = res.data.comments;

    // 각 댓글마다 프로필 이미지 비동기 할당
    for (const comment of comments.value) {
      comment.profileImg = await fetchProfile(comment.author);
    }
  } catch (error) {
    alert('댓글 목록을 불러오는데 실패했습니다.');
  }
}

function formatDate(dateStr) {
  if (!dateStr) return '';
  const d = new Date(dateStr);
  if (isNaN(d)) return '';
  return `${d.getFullYear()}.${String(d.getMonth() + 1).padStart(2, '0')}.${String(d.getDate()).padStart(2, '0')}`;
}

async function fetchPost(id) {
  loading.value = true;
  error.value = null;
  try {
    const res = await axios.get(`/api/boards/${id}`);
    post.value = res.data;
  } catch (error) {
    error.value = "게시글을 불러오지 못했습니다.";
  } finally {
    loading.value = false;
  }
}

async function deletePost() {
  if (!post.value) return;
  if (confirm("정말 삭제하시겠습니까?")) {
    try {
      await axios.delete(`/api/boards/${post.value.id}`);
      alert("삭제되었습니다.");
      router.push("/community");
    } catch {
      alert("삭제에 실패했습니다.");
    }
  }
}

function editPost() {
  if (!post.value) return;
  router.push(`/boards/${post.value.id}/edit`);
}

// 댓글 등록
async function submitComment() {
  if (!comment.value.trim()) return;
  try {
    await axios.post(`/api/boards/${route.params.id}/comments`, {
      content: comment.value,
      author: user.value?.nickname || user.value?.name || '익명',
      profileImg: currentUserProfile.value // 항상 computed에서 가져오기
    });
    comment.value = '';
    await fetchComments();
  } catch {
    alert('댓글 등록에 실패했습니다.');
  }
}

function startEdit(cmt) {
  editingCommentId.value = cmt.id;
  editContent.value = cmt.content;
}

function cancelEdit() {
  editingCommentId.value = null;
  editContent.value = '';
}

async function updateComment(commentId) {
  if (!editContent.value.trim()) return;
  try {
    await axios.put(`/api/boards/${route.params.id}/comments/${commentId}`, {
      content: editContent.value
    });
    editingCommentId.value = null;
    editContent.value = '';
    await fetchComments();
  } catch {
    alert('댓글 수정에 실패했습니다.');
  }
}

async function deleteComment(commentId) {
  if (confirm("댓글을 삭제하시겠습니까?")) {
    try {
      await axios.delete(`/api/boards/${route.params.id}/comments/${commentId}`);
      await fetchComments();
    } catch {
      alert('댓글 삭제에 실패했습니다.');
    }
  }
}

function extractFileName(url) {
  if (!url) return '';
  try {
    return decodeURIComponent(url.split('/').pop());
  } catch {
    return url;
  }
}

onMounted(async () => {
  const id = route.params.id;
  if (id) {
    await fetchPost(id);
    await fetchComments();
    // 게시글 작성자 프로필 이미지
    if (post.value && post.value.author) {
      authorProfileImg.value = await fetchProfile(post.value.author);
    }
  } else {
    error.value = "잘못된 접근입니다.";
  }
});
</script>
