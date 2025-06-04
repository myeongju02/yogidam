<template>
    <div id="webcrumbs">
        <div class="w-[1200px] p-6 font-sans min-h-screen">
            <header class="mb-8">
                <h1 class="text-3xl font-bold text-primary-700 mb-2">
                    여행자 커뮤니티
                </h1>
                <p class="text-neutral-600">
                    혼자 여행하는 사람들을 위한 공간, 당신의 이야기를 공유해보세요
                </p>
            </header>
            <div class="bg-white rounded-xl shadow-lg p-6 mb-8 transition-transform duration-300 hover:shadow-xl">
                <div class="flex flex-col md:flex-row gap-4 items-center mb-6">
                    <!-- 필터 영역 -->
                    <div class="flex w-1/4 gap-2">
                        <select v-model="selectedFilter"
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-200 transition">
                            <option value="">전체</option>
                            <option value="title">제목</option>
                            <option value="author">작성자</option>
                            <option value="content">내용</option>
                        </select>
                    </div>
                    <div class="relative flex-grow">
                        <input type="text" v-model="searchText" placeholder="게시글 검색..."
                            class="w-full py-3 px-4 pl-12 bg-gray-50 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all duration-300" />
                        <span
                            class="material-symbols-outlined absolute left-4 top-1/2 transform -translate-y-1/2 text-neutral-400">search</span>
                    </div>
                    <div class="flex gap-2 w-full md:w-auto">
                        <button @click="fetchPosts"
                            class="flex items-center gap-2 py-3 px-6 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors duration-300 shadow-md hover:shadow-lg">
                            <span>검색</span>
                        </button>
                        <button @click="goToWrite"
                            class="flex items-center gap-2 py-3 px-6 rounded-full border border-primary-500 hover:bg-primary-100 transition-colors">
                            <span class="material-symbols-outlined text-sm">add</span>
                            <span>글쓰기</span>
                        </button>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <div v-for="(post, idx) in filteredPosts" :key="idx" @click="goToDetail(post)"
                        class="bg-white border border-primary-200 rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-all duration-300 hover:-translate-y-1 group">
                        <div class="relative h-48 overflow-hidden">
                            <img v-if="post.images && post.images.length" :src="post.images[0].url" alt="게시글 대표 이미지"
                                class="w-full h-[400px] object-cover rounded-lg mb-6" />
                            <div
                                class="absolute bottom-0 left-0 p-2 bg-primary-600 text-white text-xs font-medium rounded-tr-lg">
                                {{ post.category || '여행 후기' }}
                            </div>
                        </div>
                        <div class="p-4">
                            <div class="flex justify-between items-center mb-2">
                                <h3
                                    class="text-lg font-bold line-clamp-1 group-hover:text-primary-600 transition-colors duration-300">
                                    {{ post.title }}
                                </h3>
                                <span class="flex items-center gap-1 text-neutral-500 text-sm">
                                    <span class="material-symbols-outlined text-sm">visibility</span>
                                    {{ post.views || 0 }}
                                </span>
                            </div>
                            <p class="text-neutral-600 text-sm mb-3 line-clamp-2">
                                {{ post.summary || (post.content ? post.content.slice(0, 50) : '') }}
                            </p>
                            <div class="flex justify-between items-center">
                                <div class="flex items-center gap-2">
                                    <div class="w-8 h-8 rounded-full overflow-hidden">
                                        <img :src="post.profileImg" alt="프로필 이미지" class="w-full h-full object-cover"
                                            :keywords="'profileImg, avatar, user, person'" />
                                    </div>
                                    <span class="text-sm font-medium">{{ post.author }}</span>
                                </div>
                                <span class="text-xs text-neutral-500">{{ post.date || formatDate(post.createdAt)
                                    }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 페이지네이션 영역은 그대로 -->
            <div class="flex justify-center mt-8 gap-x-2">
                <button v-for="page in totalPages" :key="page" @click="currentPage = page"
                    :class="['w-10 h-10 rounded-full flex items-center justify-center transition-all', currentPage === page ? 'bg-primary-600 text-white' : 'border border-primary-300 hover:bg-primary-100']">
                    {{ page }}
                </button>

            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

const DEFAULT_PROFILE = 'https://yogidam.s3.ap-northeast-2.amazonaws.com/profile/defaultprofileImg.png'
const selectedFilter = ref('')
const postList = ref([])
const searchText = ref('')
const currentPage = ref(1)
const itemsPerPage = 6

const router = useRouter()


const totalPages = computed(() => {
    let filtered = postList.value
    if (searchText.value) {
        filtered = filtered.filter(post => {
            if (selectedFilter.value === 'title') {
                return post.title.includes(searchText.value)
            } else if (selectedFilter.value === 'author') {
                return post.author.includes(searchText.value)
            } else if (selectedFilter.value === 'content') {
                return post.summary.includes(searchText.value)
            }
            return (
                post.title.includes(searchText.value) ||
                post.author.includes(searchText.value) ||
                post.summary.includes(searchText.value)
            )
        })
    }
    return Math.ceil(filtered.length / itemsPerPage)
})


const filteredPosts = computed(() => {
    let filtered = postList.value
    if (searchText.value) {
        filtered = filtered.filter(post => {
            if (selectedFilter.value === 'title') {
                return post.title.includes(searchText.value)
            } else if (selectedFilter.value === 'author') {
                return post.author.includes(searchText.value)
            } else if (selectedFilter.value === 'content') {
                return post.summary.includes(searchText.value)
            }
            return (
                post.title.includes(searchText.value) ||
                post.author.includes(searchText.value) ||
                post.summary.includes(searchText.value)
            )
        })
    }
    // 2. 페이지네이션
    const start = (currentPage.value - 1) * itemsPerPage
    const end = start + itemsPerPage
    return filtered.slice(start, end)
})

function goToWrite() {
    router.push({ name: "NewBoard" })
}

function goToDetail(post) {
    router.push(`/boards/${post.id}`)
}

async function fetchProfileImg(authorId) {
    try {
        const res = await axios.get('/api/member/profile', { params: { userId: authorId } });
        if (res.data && typeof res.data === 'string' && res.data.trim() !== '') {
            return res.data;
        }
        return DEFAULT_PROFILE;
    } catch (e) {
        return DEFAULT_PROFILE;
    }
}
async function fetchPosts() {
    try {
        const response = await axios.get('/api/boards');
        const posts = response.data.map(board => ({
            id: board.id,
            images: board.images || [],
            category: board.category || '여행 후기',
            title: board.title,
            views: board.views || 0,
            summary: board.summary || board.content?.slice(0, 50) || '',
            profileImg: DEFAULT_PROFILE, // 임시 기본값
            author: board.author,
            date: board.date || new Date(board.createdAt).toLocaleDateString(),
            keywords: board.keywords || ''
        }));

        // 모든 프로필 이미지 비동기로 가져오기
        await Promise.all(posts.map(async (post) => {
            if (post.author) {
                post.profileImg = await fetchProfileImg(post.author);
            }
        }));

        // 모든 이미지가 준비된 후 postList를 할당
        postList.value = posts;
    } catch (error) {
        console.error('게시글 불러오기 실패:', error);
    }
}

onMounted(() => {
    fetchPosts();
});
</script>
